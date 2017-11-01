module ApplicationHelper
  def cp(path)
    "current" if current_page?(path)
  end
  def cp_transactions(path)
    if current_page?(controller: 'transactions', action: 'index', filter: 'pickups')
      "current-pickups"
    elsif current_page?(controller: 'transactions', action: 'index', filter: 'recharges')
      "current-recharges"
    elsif current_page?(controller: 'transactions', action: 'index')
      "current-transactions"
    end
  end
end
