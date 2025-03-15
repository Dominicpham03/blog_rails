class Api::RootController < ApiController
    self.extra_actions = {test: :get}
  
    def root
      render(
        api: {
          message: "Welcome to the API.",
          how_to_authenticate: <<~END.lines.map(&:strip).join(" "),
            You can use this API with your normal login session. Otherwise, you can insert your API
            key into a Bearer Authorization header, or into the URL parameters with the name
            `api_key`.
          END
        },
      )
    end
  
    def test
      render(api: {message: "Hello, world!"})
    end
  end