module Authentication
  def stub_omniauth
    OmniAuth.config.test_mode = true
    OmniAuth.config.mock_auth[:twitter] = OmniAuth::AuthHash.new({
      provider: "twitter",
      uid: "1234",
      extra: {
        raw_info: {
          screen_name: "AlirezaAndersen",
          name: "Alireza Andersen",
          location: "Denver, CO",
          profile_image_url: "https://robohash.org/#{('a'..'z').to_a.shuffle.slice(0..10).join}"
        }
      },
      credentials: {
        token: "deepdish",
        secret: "secretdeepdish"
      }
    })
  end
end
