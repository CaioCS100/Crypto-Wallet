namespace :dev do
  desc 'delete and create or just create some datas to use for tests in the system. 
  You must be using the developed environment'
  task setup: :environment do
    if Rails.env.development?
      show_spinner('Deleting DB...') { %x(rails db:drop:_unsafe) }
      show_spinner('Creating DB...') { %x(rails db:create) }
      show_spinner('Migrating BD...') { %x(rails db:migrate) }
      show_spinner('Creating Seeds for DB...') { %x(rails db:seed) }
    else
      show_spinner('Deleting DB...', 'error', 'You must be using the developed environment')
    end
  end

  def show_spinner(msg_description, info_animation = 'success', msg_success_or_error = 'Success!')
    spinner = TTY::Spinner.new("[:spinner] #{msg_description}")
    spinner.auto_spin
    if info_animation == 'success'
      yield
      spinner.success("(#{msg_success_or_error})")
    else
      spinner.error("(#{msg_success_or_error})")
    end
  end
end
