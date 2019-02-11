Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, "46446544106-7ehg49at20dkjmfbdq5jlpv4r92g71f8.apps.googleusercontent.com", "FxRdvdqniFfM5Eiqu7raHMjO"
end