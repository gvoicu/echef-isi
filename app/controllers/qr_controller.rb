class QrController < ApplicationController
  def index
    table = params[:qr_code]
    @qr = RQRCode::QRCode.new(request.host + '/menu/' + table)
    
    render:layout => false
  end
end