class AssetsController < ApplicationController

  def index
    @assets = Asset.all
  end

  def new
    @assets = Asset.all
    @assets.each do |asset|
      @asset_hash[asset.id] = { name: asset.name, ticker: asset.ticker }
    end
  end

  def show
    @asset = Asset.find(params[:id])
  end

end
