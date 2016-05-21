
  enable :sessions

get '/' do
  # La siguiente linea hace render de la vista 
  # que esta en app/views/index.erb
 @error = params[:error]
  erb :index
end

post '/login' do
  @usuario = params[:user]
  pass = params[:pass]
  

  if User.where(user: @usuario, password: pass).empty?
    redirect to("/?error=1")
  else
    session[:login] = @usuario
    erb :secret
  end
  
end

get '/new_user' do
  erb :new_user
end

post '/new' do
  nombre = params[:name]
  usuario = params[:user]
  correo = params[:correo]
  pass = params[:pass]
  @user = User.new(name: nombre, user: usuario, email: correo, password: pass)
  
  if @user.save
    erb :index
  else
    @user.errors.full_messages  
    redirect to("/new_user?error=1")
  end
 
end

get '/secret' do
  if session[:login]
    erb :secret
  else
    erb :index
  end
end

get '/destruir' do
  session.clear
  redirect to("/")
end