class ImagePingerJob
  include Sidekiq::Job
  sidekiq_options queue: :low

  attr_reader :image
  def perform(image_id)
    @image = Image.find(image_id)

    begin
      response = ping_url
      update_http_status(response.status)
    rescue Faraday::ConnectionFailed
      update_http_status(:not_found)
    end
  end

  def update_http_status(status)
    @image.update(
      http_status: status,
      pinged_at: DateTime.current
    )
  end

  def connection
    @connection ||= Faraday.new(
      request: {
        open_timeout: 10,
        timeout: 10
      },
      headers: {
        'Accept' => 'image/*'
      }
    )
  end

  def ping_url
    connection.head image.url
  end
end
