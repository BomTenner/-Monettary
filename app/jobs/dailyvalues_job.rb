require 'sidekiq-scheduler'

class DailyvaluesJob < ApplicationJob
  queue_as :default

  def perform
    # AssetValue.add_today_values
    AssetValue.test_job
  end
end
