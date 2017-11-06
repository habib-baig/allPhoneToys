require 'spec_helper'

describe 
describe Admin::CategoriesController do
  render_views

  before(:each) do
    Factory(:blog)
    #TODO Delete after removing fixtures
    Profile.delete_all
    henri = Factory(:user, :login => 'henri', :profile => Factory(:profile_admin, :label => Profile::ADMIN))
    request.session = { :user => henri.id }
  end

  it "test_index" do
    get :index
    assert_response :redirect, :action => 'index'
  end

## added rspec test case here
  describe "test_create" do
    before(:each) do
      get :new
    end

    it 'should render template new' do
      assert_template 'new'
      assert_tag :tag => "table",
        :attributes => { :id => "category_container" }
    end

    it 'should have valid category' do
      post :edit, :category => {:name => "Hello", :keywords => "Hi", :permalink => "Bu", :description => "Bye"}
      assert_response :redirect, :action => "index"
      ## not_to_be_nil -> not_to be_nil
      ## Admin::CategoriesController test_create should have valid category
      ## Failure/Error: expect(assigns(:category)).not_to_be_nil
      expect(assigns(:category)).not_to be_nil
      ## to_eq -> to eq
      ## Admin::CategoriesController test_create should have valid category
      ## Failure/Error: expect(flash[:notice]).to_eq("Category was successfully saved.")
      expect(flash[:notice]).to eq("Category was successfully saved.")
    end
  end
end
