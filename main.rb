require "selenium-webdriver"
require "rubygems" 
require 'webdrivers'


def bot

    options = Selenium::WebDriver::Edge::Options.new(args:['headless'])

    driver = Selenium::WebDriver.for(:edge, options: options)

    driver.navigate.to "https://docs.google.com/forms/d/e/1FAIpQLScRWyqpgDXKHu6pV1wEhewUIEnrHiiTnvQFgJ8SLtiGx7EebQ/viewform"

    #biggest = driver.find_element(:class_name, "F9yp7e")
    title = driver.title

    p title 

    driver.quit
end 

bot()