require "selenium-webdriver"
require "rubygems" 
require 'webdrivers'


def bot

    options = Selenium::WebDriver::Edge::Options.new(args:['headless'])

    driver = Selenium::WebDriver.for(:edge, options: options)

    driver.navigate.to "https://docs.google.com/forms/d/e/1FAIpQLScRWyqpgDXKHu6pV1wEhewUIEnrHiiTnvQFgJ8SLtiGx7EebQ/viewform"

    # All questions have the same class_name
    questions = driver.find_elements(:class_name, "M7eMe")
    input_fields = driver.find_elements(:css, ".whsOnd.zHQkBf")
    radio_labels = driver.find_elements(:css, ".docssharedWizToggleLabeledContainer.ajBQVb")
    title = driver.title

    p input_fields.length 
    p radio_labels.length 

    driver.quit


end 

bot()