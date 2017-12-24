require "quick_badge_generator/version"
require 'net/http'

module QuickBadgeGenerator
  SHIELDS_URL_PREFIX = 'https://img.shields.io/badge/'.freeze

  def self.badge(args = {})
    label = args[:label] || 'label'
    message = args[:message] || 'message'
    color = args[:color] || 'green'
    style = args[:style] || 'flat'
    puts "#{SHIELDS_URL_PREFIX}#{label}-#{message}-#{color}.svg?style=#{style}"
    escaped_url = URI.escape("#{SHIELDS_URL_PREFIX}#{label}-#{message}-#{color}.svg?style=#{style}")
    uri = URI.parse(escaped_url)
    Net::HTTP.get(uri)
  end
end