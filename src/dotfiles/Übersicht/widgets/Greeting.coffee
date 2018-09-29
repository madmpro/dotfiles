command: "finger `whoami` | awk -F: '{ print $3 }' | head -n1 | sed 's/^ // '"

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

  #Grab the name of the current user.
  #If you would like to edit this, replace "output.split(' ')" with your name (in quotation marks, such as: name = "rohan")
  name = output.split(' ')

  # Greeting segments for the day.
  segments = ["Good morning, #{name[0]}.", "Good afternoon, , #{name[0]}.", "Good evening, #{name[0]}."]

  # Fetch the current hour.
  hour = (new Date()).getHours()

  # Greeting logic.
  greeting = segments[0] if hour <= 11
  greeting = segments[1] if 11 < hour <= 17
  greeting = segments[2] if 17 < hour <= 24

  # DOM manipulation.
  $(domEl).find('.greeting').text("#{greeting}")
