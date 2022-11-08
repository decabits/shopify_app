# frozen_string_literal: true

module ShopifyApp
  module Logger
    LOG_LEVELS = { debug: 0, info: 1, warn: 2, error: 3, off: 4 }
    PREFIX = "ShopifyApp"

    def self.send_to_logger(log_level, message)
      return if enabled_for_log_level?(log_level)

      current_shop = ShopifyAPI::Context.active_session&.shop || "Shop Not Found"
      message_context = "[ #{PREFIX} | #{log_level.to_s.upcase} | #{current_shop} ] #{message}"

      ShopifyAPI::Context.logger.send(log_level, message_context + message)
    end

    def self.debug(message)
      send_to_logger(:debug, message)
    end

    def self.info(message)
      send_to_logger(:info, message)
    end

    def self.warn(message)
      send_to_logger(:warn, message)
    end

    def self.error(message)
      send_to_logger(:error, message)
    end

    def self.deprecated(message)
      send_to_logger(:warn, "DEPRECATED - #{message}")
    end

    private

    def enabled_for_log_level?(log_level)
      LOG_LEVELS[log_level] <= LOG_LEVELS[ShopifyApp.configuration.log_level]
    end
  end
end
