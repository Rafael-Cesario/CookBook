module ResponseHelper
  def json
    JSON.parse(response.body).symbolize_keys
  end
end
