<!doctype html>
<html lang="en"> 
<head> 
<title>Guessing Game</title> 
</head> 
<body> <div align="center">
<h1>Guessing Game</h1>

<% 
	int randomNum = (int)(Math.random() * 10) + 1;
	String n = request.getParameter("randomNum");
	if (n != null && !n.isEmpty()) {
		randomNum = Integer.parseInt(n);
	}
	int nextIteration;
	int userInput = 0;
	String ui = request.getParameter("userInput");
	try{
		if (ui != null && !ui.isEmpty()){
			userInput = Integer.parseInt(ui);
		}
	}catch(NumberFormatException e){
			userInput=0;
	}
	
	if (userInput == randomNum){
		nextIteration = (int)(Math.random() * 10) + 1;
	}
	else {
		nextIteration = randomNum;
	}
%>

	<form method="post" action="guessing_game.jsp">
		<input type="text" name="userInput">
		<input type = "hidden" value="<%= nextIteration %>" name="randomNum" />
		<p></p>
		<input type = "submit" value = "Submit">
		<input type = "submit" value = "Hint" name = "hint">
		<input type = "submit" value = "New Game" name = "newGame">
	</form>

	<p></p>
<% 
		
		nextIteration = randomNum;
		if (request.getParameter("hint") != null){ %>
				The randomly generated number is <%= randomNum %>
			<% 
		}
		else if (userInput == 0){%>
			Please Enter a Valid Number Between 1 and 10
		<% }
		else{
			if (userInput == randomNum){%>
				<strong>Congratulations! Your guess of <%= userInput %> was right!</strong>
				<% if (request.getParameter("newGame") != null){
					userInput = 0;
				}%>
			<%} 
			else if (userInput < randomNum){ %>
			Your guess of <%= userInput %> is too small!
		
		<% }
			else if (userInput > randomNum){ %>
			Your guess of <%= userInput %> is too large!
		
		<% }
			
			
		}
	
%>
	
</div></body> 
</html>