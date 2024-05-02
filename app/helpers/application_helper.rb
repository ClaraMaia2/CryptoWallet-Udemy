# para todas as views

module ApplicationHelper
  def date_br(date_us)
    date_us.strftime("%d/%m/%Y")
  end

  def rails_env
    if Rails.env.development?
      "Development"
    elsif Rails.env.production?
      "Production"
    else
      "Test"
    end
  end

  def locale
    I18n.locale == :en ? "United States" : "Brazilian Portuguese"
  end
end
