/*  This is the styling for the About page contact form  */

travelmag

about-form-container {
	display: flex;
	flex-direction: column;
	justify-content: center; 
	margin-block-start: 100px; }

about-form-title {
	text-align: center;
	font-size: 2rem; 
	margin-block-end: 30px; 
	margin-block-start: 50px; }

about-form-subtitle {}


form {
	display: flex;
	flex-flow: column;
	justify-content: space-around; 
	padding-inline: 50px; }
	

input[type="text"], textarea, input[type="submit"] {
	width: 50%; 
	margin-inline: auto;
	transition-duration: 0.2s;
	font-size: 1.125rem;	
	letter-spacing: 0.03em;
	min-width: 400px;
 }
 
input[type="text"], textarea {
	padding-inline-start: 15px; }

input + input {
	margin-block-start: 15px; }

input + textarea + input {
	margin-block-start: 15px; }

input[type="text"] {
	line-height: 2.5em; }

input + textarea {
	margin-block-start: 15px; }

textarea {
	height: 190px;
	max-height: 190px;
	max-width: 50%;
	min-width: 400px;
	line-height: 1.5em;
	padding-block-start: 15px; }
	
input[type="submit"] { 
	background-color: #ffa;
	padding-inline: 0.9em;
	padding-block: 0.6em;
	font-size: 1.125rem;
	text-align: center;
	vertical-align: center;
	text-transform: uppercase;
	font-weight: 600; 
	border: 2px solid #eed; }

input[type="submit"]:hover {
	background-color: gold;
	transition-duration: 0.3s;
	border: 2px solid #ddd; }

			
			<about-form-container>
				<about-form-title>We'd like to hear from you!</about-form-title>
				<form>
					<input type="text" name="name" placeholder="Name">
					<input type="text" name="email" placeholder="Email">
					<textarea name="note" placeholder="Add a note:"></textarea>
					<input type="submit" name="submit" value="Submit">
				</form>
			</about-form-container>



***


/*  this is the styling for the form  */

blog
						
leave-reply-form-container {
	margin-block: 50px; }
	
reply-form-title {
	font-family: Arial, sans-serif; 
	font-size: 2rem;
	font-weight: 400;
	text-transform: uppercase;
	letter-spacing: 6px; }
	
form {
	display: flex;
	flex-direction: column;
	font-family: Arial, sans-serif;
	font-size: 1.2rem;
	color: #eef; }

form-top {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center; }
	
textarea {
	height: 190px;
	max-height: 190px;
	width: 100%;
	min-width: 400px;
	max-width: 873.6px;
	line-height: 1.5em;
	padding-inline-start: 10px; 
	padding-block-start: 15px; }
	
form-bottom {
	display: flex;
	flex-direction: row;
	justify-content: space-between;
	padding-block: 20px; }
	
form-bottom > input[type="name"] {}

form-bottom > input[type="email"] {}

form-bottom > input[type="website"] {} 
	
form-bottom > input[type="name"] + form-bottom > input[type="email"] + form-bottom > input[type="website"] {
	margin-inline-start: 20px;
	width: 30%; 
	line-height: 330px; 	}

form-send-container {
	width: 100%;
	display: flex;
	flex-direction: row;
	justify-content: flex-end; }


checkbox-container {
	width: 99%;
	margin-inline: auto;
	margin-block: 15px;	}

input[type="checkbox"] { }

label {
	color: #00f;
	padding-inline-start: 15px; }
	
	
input[type="submit"] {
	width: 100px;
	background-color: #fff;
	color: #e0e0e0;
	border: 1px solid #000;
	border-radius: 10px;
	font-size: 1.2rem;
	padding-inline: 0.9em;
	padding-block: 0.6em; }

input[type="submit"]:hover {
	font-size: 1.2rem;
	background-color: #fff;
	color: #e0e0e0;
	border: 1px solid #eef;
	padding-inline: 0.9em;
	padding-block: 0.6em; }

						
						<leave-reply-form-container>
							<reply-form-title>Leave a reply</reply-form-title>
							<form>
								<form-top>
									<textarea name="note" placeholder="Add a note (required)"></textarea>
								</form-top>
								<form-bottom>
									<input type="text" name="name" placeholder="Name (required)" required>
									<input type="text" name="email" placeholder="Email (required)" required>
									<input type="text" name="website" placeholder="Website...">												
								</form-bottom>
								<form-send-container>
									<checkbox-container>
										<input type="checkbox" name="checkbox">
										<label for="checkbox">Save my name, email and website for the next time I 	comment</label>
	 									<input type="submit" name="submit" value="Send">															
									</checkbox-container>																
								</form-send-container>
							</form>
						</leave-reply-form-container>

***



