class TransactionsController < ApplicationController
  before_action :set_transaction, only: [:show, :edit, :update, :destroy]
  before_action :require_admin, :admin_privacy, only: [:todays_pickups, :todays_recharges]

  # GET /transactions
  # GET /transactions.json
  def index
   if session[:user_id]
      @transactions = Transaction.where(user_id: session[:user_id])
   elsif session[:admin_id]
      @transactions = Transaction.where(nil)
   else
      redirect_to login_path
   end
   session[:trans_user_name              ] = params[:name                      ]
   session[:trans_amount                 ] = params[:amount                    ]
   session[:trans_phoneNumber            ] = params[:phoneNumber               ]
   session[:trans_provider               ] = params[:provider                  ]
   session[:trans_location               ] = params[:location                  ]
   session[:trans_status                 ] = params[:status                    ]
   session[:trans_scheduledPickupStartDT ] = params[:scheduledPickupStartDT    ]
   session[:trans_scheduledPickupEndDT   ] = params[:scheduledPickupEndDT      ]
   session[:trans_messagedPickupDT       ] = params[:messagedPickupDT          ]
   session[:trans_pickedUpDT             ] = params[:pickedUpDT                ]
   session[:trans_rechargeDueDT          ] = params[:rechargeDueDT             ]
   session[:trans_rechargedDT            ] = params[:rechargedDT               ]
   session[:trans_remarks                ] = params[:remarks                   ]

    @transactions = @transactions.trans_user_name(session[:trans_user_name])  if session[:trans_user_name].present?
    @transactions = @transactions.trans_amount(session[:trans_amount]) if session[:trans_amount].present?
    @transactions = @transactions.trans_phoneNumber(session[:trans_phoneNumber]) if session[:trans_phoneNumber].present?
    @transactions = @transactions.trans_provider(session[:trans_provider]) if session[:trans_provider].present?
    @transactions = @transactions.trans_location(session[:trans_location]) if session[:trans_location].present?
    @transactions = @transactions.trans_status(session[:trans_status]) if session[:trans_status].present?
    @transactions = @transactions.trans_scheduledPickupStartDT(session[:trans_scheduledPickupStartDT]) if session[:trans_scheduledPickupStartDT].present?
    @transactions = @transactions.trans_scheduledPickupEndDT(session[:trans_scheduledPickupEndDT]) if session[:trans_scheduledPickupEndDT].present?
    @transactions = @transactions.trans_messagedPickupDT(session[:trans_messagedPickupDT]) if session[:trans_messagedPickupDT].present?
    @transactions = @transactions.trans_rechargeDueDT(session[:trans_rechargeDueDT]) if session[:trans_rechargeDueDT].present?
    @transactions = @transactions.trans_rechargedDT(session[:trans_rechargedDT]) if session[:trans_rechargedDT].present?
    @transactions = @transactions.trans_remarks(session[:trans_remarks]) if session[:trans_remarks].present?

  end

  def todays_pickups
    @transactions = Transaction.where("DATE(\"scheduledPickupStartDT\") = ?", Date.today) #Filter only transactions to be picked up today
    @transactions = @transactions.trans_status_pickups() #Filter only transactions with status =1 or 2
  end

  def todays_recharges
    @transactions = Transaction.where("DATE(\"rechargeDueDT\") = ?", Date.today)#filter only transactions to be recharged today
    @transactions = @transactions.trans_status_recharges() #Filter only transactions with status =2 or 3
  end

  # GET /transactions/1
  # GET /transactions/1.json
  def show
  end

  # GET /transactions/new
  def new
    @transaction = Transaction.new
  end

  # GET /transactions/1/edit
  def edit
  end

  # POST /transactions
  # POST /transactions.json
  def create
    @transaction = Transaction.new(transaction_params)
    @transaction.update(user_id: session[:user_id])
    @transaction.update(status: 1)


    respond_to do |format|
      if @transaction.save
        format.html { redirect_to @transaction, notice: 'Transaction was successfully created.' }
        format.json { render :show, status: :created, location: @transaction }
      else
        format.html { render :new }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transactions/1
  # PATCH/PUT /transactions/1.json
  def update
    respond_to do |format|
      if @transaction.update(transaction_params)
        format.html { redirect_to @transaction, notice: 'Transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @transaction }
      else
        format.html { render :edit }
        format.json { render json: @transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /transactions/1
  # DELETE /transactions/1.json
  def destroy
    @transaction.destroy
    respond_to do |format|
      format.html { redirect_to transactions_url, notice: 'Transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def do_pickup
    transaction = Transaction.find(params[:id])
    if (transaction.status == 1)
      transaction.status=2 #status=picked up
    elsif (transaction.status == 2)
      transaction.status = 1
    end
    transaction.save
    redirect_back fallback_location: root_path
  end

  def do_recharge
    transaction = Transaction.find(params[:id])
    if (transaction.status == 2)
      transaction.status=3 #status=recharged
    elsif (transaction.status == 3)
      transaction.status = 2
    end
    transaction.save
    redirect_back fallback_location: root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transaction
      @transaction = Transaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def transaction_params
      params.require(:transaction).permit(:amount, :phoneNumber, :provider, :location, :status, :scheduledPickupStartDT, :scheduledPickupEndDT, :messagedPickupDT, :pickedUpDT, :rechargeDueDT, :rechargedDT, :remarks)
    end
end
