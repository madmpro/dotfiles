command: "echo Hello World"

refreshFrequency: 90000

style: """
   color: white;
   
   left: 25px;
   bottom: 185px;
   
   font-family: Ubuntu, -apple-system, Helvetica Neue;
   font-weight: 500;
   letter-spacing: 1px;
"""

#Render function
render: -> """
	<div class="greeting"></div>
"""

# Update function.
update: (output, domEl) ->

  # Greeting segments for the day.
  segments = ["Good morning, Loic", "Good afternoon, Loic", "Good evening, Loic"]

  # Fetch the current hour.
  hour = (new Date()).getHours()

  # Greeting logic.
  greeting = segments[0] if hour <= 11
  greeting = segments[1] if 11 < hour <= 17
  greeting = segments[2] if 17 < hour <= 24

  # DOM manipulation.
  $(domEl).find('.greeting').text("#{greeting}")