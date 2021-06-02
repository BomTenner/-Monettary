

class AssetsController < ApplicationController

  def show 
    @asset = Asset.find(params[:id])
    @additional_infos = get_hist_values
  end

  def get_hist_values
    hist_values = {}
    all_values = AssetValue.all
    all_assets = Asset.all

    all_assets.each do |asset|
      related_values = all_values.select { |value| value.asset == asset}
      all_old = []
      related_values.each do |value|
        my_arr = [
          value.date,
          value.value
        ]
        all_old << my_arr
      end
      hist_values[asset.name] = all_old
    end

    return hist_values
  end
end
