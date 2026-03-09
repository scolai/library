/*  FOOTER 3 COLUMNS  */

	
footer { 	
	background-color: hsla(0,0%,0%, 0.9);
	color: #fff; }
footer-body { 
	width: 65%;
	margin-block: 50px; 
	margin-inline: auto;
	background-color: hsla(0, 0%, 0%. 0.8);
	display: flex;
	flex-flow: row wrap;
	justify-content: flex-start;
	color: #fff; }

footer-column {
	flex-basis: 33.3%; }

footer-column + footer-column {
}
	
footer-about {
	flex: 1; 
	display: flex;
	flex-flow: column wrap;
	justify-content: space-around; }
footer-about > footer-logo {
	display: block;
/*	background-image: url("../images/blog-logo.png"); */ 
	margin-block: 25px; }
	
footer-logo > span {
	font-family: "Times New Roman";
	font-size: 4rem;
	font-weight: 800;
	text-transform: uppercase; } 
	
footer-about > p { 
	color: hsl(210, 36%, 96%);
	padding-block-end: 25px;
	margin-block: unset; }
	
footer-about-title {
	width: 100%; 
	display: block;
	font-family: Helvetica;
	text-transform: uppercase;
	font-size: 1.2rem;
	text-align: center;
	padding-block-end: 15px;
	border-block-end: 1px solid hsla(210, 36%, 96%, 0.2); }

footer-about-title + footer-about-address {
	margin-block-start: 55px; }

footer-about-address {
	display: block; }

footer-about-address-item + footer-about-address-item {
	display: block;
	margin-block-start: 15px; }

street-address, tel, email a {
	font-family: Arial;
	font-size: 1.1rem;
	font-weight: 500;
	color: #eee; 
	line-height: 1.1em; 
	text-decoration: none; }
tel {}
footer-about-address-item a:any-link {
	color: #fff; }


footer-cards + footer-cards {
	margin-block-start: 30px; 
	display: block; }


footer-card-item {
	display: flex;
	flex-flow: row wrap; }

footer-cards-title {
	display: block;
	margin-block: 25px; 
	font-size: 1rem;
	font-family: "Source Code Pro";
	font-weight: 700;
	letter-spacing: 1.01px;
	text-align: center; 
	text-transform: uppercase;
	color: hsla(60,100%,50%,0.7);	 }
	
footer-card-item + footer-card-item {
	margin-block-start: 20px; }
	
footer-card-left {
	flex-basis: 25%;
	display: flex;
	justify-content: center;
	align-items: center; }
footer-card-left > footer-card-image {
	background-color: red;
	display: block;
	height: 75px;
	width: 75px; }
	

footer-card-right {
	flex-basis: 70%;
	padding-inline-start: 10px; }
footer-card-title {
	display: block;
	margin-block-end: 10px; 
	font-family: Arial, sans-serif;
	font-size: 0.9rem;
	text-transform: uppercase; 
	font-weight: 600; 
	letter-spacing: 1.01px; }
footer-card-meta {
	display: block;
	font-size: 0.8rem; }
footer-card-meta span {
	color: #ffe;
	font-family: Arial, sans-serif;
	font-weight: 600; }

footer legal {
	display: block; 
	width: 100%; 
	background-color: hsl(0,0%,0%); }
legal-links-container {
	width: 65%;
	margin-inline: auto;
	display: flex;
	flex-flow: row wrap;
	justify-content: space-between; 
	align-items: center; 	}
legal-links {
	flex-basis: 25%;
	display: inline;
	list-style-type: none; }
legal-link + legal-link {
	margin-inline-start: 10px; }
legal-link > a:any-link {
	color: #fff;	}

legal > p { 
	flex-basis: 25%;
	text-align: right; }
	


	<footer>
		<footer-body>

		<footer-column>
			<footer-about>
				<footer-logo><span>LOGO</span></footer-logo>
				<p>"I have come to think that the true likeness of Flannery O'Connor will be painted by herself, a self-portrait in words, to be found in her letters . . . There she stands, a phoenix risen from her own words: calm, slow, funny, courteous, both modest and very sure of herself, intense, sharply penetrating, devout </p>
			</footer-about>
			
			
			<footer-about-title>about us</footer-about-title>
			
		
			<footer-about-address>
				<footer-about-address-item>
					<street-address>555 Washington St Washington DC</street-address>
				</footer-about-address-item>
				<footer-about-address-item>
					<tel>555 555 5555</tel>
				</footer-about-address-item>
				<footer-about-address-item>
					<email><a href="">scotty@scotty.com</a></email>
				</footer-about-address-item>
			</footer-about-address>
		</footer-column>

		<footer-column>
			<footer-cards>
					<footer-cards-title>Most commented</footer-cards-title>
					<footer-card-item>
						<footer-card-left><footer-card-image></footer-card-image></footer-card-left>
						<footer-card-right>
							<footer-card-title>destinations Package</footer-card-title>
							<footer-card-meta><span>destinations / </span>January 11, 2000</footer-card-meta>
						</footer-card-right>
					</footer-card-item>
			</footer-cards>

			<footer-cards>
					<footer-card-item>
						<footer-card-left><footer-card-image></footer-card-image></footer-card-left>
						<footer-card-right>
							<footer-card-title>destinations Package</footer-card-title>
							<footer-card-meta><span>destinations / </span>January 11, 2000</footer-card-meta>
						</footer-card-right>
					</footer-card-item>
			</footer-cards>

			<footer-cards>
					<footer-card-item>
						<footer-card-left><footer-card-image></footer-card-image></footer-card-left>
						<footer-card-right>
							<footer-card-title>destinations Package</footer-card-title>
							<footer-card-meta><span>destinations / </span>January 11, 2000</footer-card-meta>
						</footer-card-right>
					</footer-card-item>
			</footer-cards>

			<footer-cards>
					<footer-card-item>
						<footer-card-left><footer-card-image></footer-card-image></footer-card-left>
						<footer-card-right>
							<footer-card-title>destinations Package</footer-card-title>
							<footer-card-meta><span>destinations / </span>January 11, 2000</footer-card-meta>
						</footer-card-right>
					</footer-card-item>
			</footer-cards>
		</footer-column>
		
		<footer-column>
			<footer-cards>
					<footer-cards-title>Most commented</footer-cards-title>
					<footer-card-item>
						<footer-card-left><footer-card-image></footer-card-image></footer-card-left>
						<footer-card-right>
							<footer-card-title>destinations Package</footer-card-title>
							<footer-card-meta><span>destinations / </span>January 11, 2000</footer-card-meta>
						</footer-card-right>
					</footer-card-item>
			</footer-cards>

			<footer-cards>
					<footer-card-item>
						<footer-card-left><footer-card-image></footer-card-image></footer-card-left>
						<footer-card-right>
							<footer-card-title>destinations Package</footer-card-title>
							<footer-card-meta><span>destinations / </span>January 11, 2000</footer-card-meta>
						</footer-card-right>
					</footer-card-item>
			</footer-cards>

			<footer-cards>
					<footer-card-item>
						<footer-card-left><footer-card-image></footer-card-image></footer-card-left>
						<footer-card-right>
							<footer-card-title>destinations Package</footer-card-title>
							<footer-card-meta><span>destinations / </span>January 11, 2000</footer-card-meta>
						</footer-card-right>
					</footer-card-item>
			</footer-cards>

			<footer-cards>
					<footer-card-item>
						<footer-card-left><footer-card-image></footer-card-image></footer-card-left>
						<footer-card-right>
							<footer-card-title>destinations Package</footer-card-title>
							<footer-card-meta><span>destinations / </span>January 11, 2000</footer-card-meta>
						</footer-card-right>
					</footer-card-item>
			</footer-cards>
		</footer-column>	
		</footer-body>		
		<legal>
			<legal-links-container>
				<legal-links>
					<legal-link><a href="">Home</a></legal-link>
					<legal-link><a href="">Blog</a></legal-link>
					<legal-link><a href="">About Us</a></legal-link>
					<legal-link><a href="">Contact Us</a></legal-link>
				</legal-links>
				<p>&copy; Scotty Site. All rights reserved.</p>
			</legal-links-container>
		</legal>			
	</footer>
