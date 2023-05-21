require 'selenium-webdriver'
require 'rubygems'
require 'webdrivers'

class Bot 
    @@options = Selenium::WebDriver::Edge::Options.new(args:['headless'])
    @@driver = Selenium::WebDriver.for(:edge, options: @@options)
    @@driver.navigate.to "https://docs.google.com/forms/d/e/1FAIpQLScRWyqpgDXKHu6pV1wEhewUIEnrHiiTnvQFgJ8SLtiGx7EebQ/viewform"

    def questions_with_input_fields(*args)
        nodes = []
        args.each do |question|
            node = @@driver.find_element(:xpath, "//span[text()= '#{question}']")
            nodes << node.text 
        end
        p nodes
        driver.quit
    end
end

robot = Bot.new 
robot.questions_with_input_fields('What is your name?')