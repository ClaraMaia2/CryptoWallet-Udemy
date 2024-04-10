namespace :dev do
  desc "Configure development environment"
  task setup: :environment do
    if Rails.env.development?
      show_spinner("Deleting DB") do
        %x(rails db:drop)
      end

      show_spinner("Creating DB") do
        %x(rails db:create)
      end

      show_spinner("Migrating DB") do
        %x(rails db:migrate)
      end

      show_spinner("Seeding DB") do
        %x(rails db:seed)
      end

    else
      puts "You are not in the development environment"
    end
  end

  def show_spinner(start_msg, end_msg="(Success)")
    spinner = TTY::Spinner.new("[:spinner] #{start_msg}")
    spinner.auto_spin
    yield
    spinner.success("#{end_msg}")
  end
end
