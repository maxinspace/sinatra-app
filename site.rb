require 'sinatra'
require 'pony'

get '/' do
  File.read(File.join(settings.public_folder, 'index.html'))
end

get '/index.html' do
  File.read(File.join(settings.public_folder, 'index.html'))
end

get '/events.html' do
  File.read(File.join(settings.public_folder, 'events.html'))
end

get '/en-events.html' do
  File.read(File.join(settings.public_folder, 'en-events.html'))
end

get '/portfolio.html' do
  File.read(File.join(settings.public_folder, 'portfolio.html'))
end

get '/en-portfolio.html' do
  File.read(File.join(settings.public_folder, 'en-portfolio.html'))
end

get '/contacts.html' do
  File.read(File.join(settings.public_folder, 'contacts.html'))
end

get '/en-contacts.html' do
  File.read(File.join(settings.public_folder, 'en-contacts.html'))
end

post '/sendmail' do
  Pony.mail(
    :to => params[:email],
    :from => params[:email],
    :subject => "Hello, #{params[:name]} filled the form on ADEKO site!",
    :body => "#{params[:name]} said: \n
              #{params[:message]} \n
              Contacts: \n
                Phone: #{params[:phone]} \n
                Company: #{params[:company]}",

    :via => :sendmail,
    :via_options => {
      :location  => '/usr/sbin/sendmail', # defaults to 'which sendmail' or '/usr/sbin/sendmail' if 'which' fails
      :arguments => '-t' # -t and -i are the defaults
    }
  )

  redirect back
end
