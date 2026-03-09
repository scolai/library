HORIZONTAL WIDE LAYOUT IMAGE LEFT SIDE 

travelmag

card-container {
	display: flex;
	flex-flow: row wrap;
	background-color: hsl(210, 36%, 96%); }
card-container:hover {
	background-color: hsla(360, 82%, 89%, 0.1);
	transition-duration: 0.2s;
  background:linear-gradient(0deg, rgba(255, 0, 150, 0.3), rgba(255, 0, 150, 0.3)), background-size: cover; }

card-container-left {
	flex: 58%; 
	display: flex;
	align-items: center; }
card-container-left > a {
	height: 100%;
	width: 100%;
	background-image: url("../images/boss.png"); }

card-container-right {
	flex: 42%; 
	padding-inline-start: 5em;
	padding-inline-end: 3em;
	padding-block: 40px;
	border: 1px solid hsla(212, 33%, 89%, 0.4);	 }

card-heading-container {
	display: flex;
	flex-flow: row wrap;
	justify-content: flex-start;
	align-items: center; 
	font-size: 1rem; 
	font-weight: 600;
	text-transform: uppercase; }
	
card-heading-container > a {
	color: #000e;
	background-color: hsl(212, 33%, 89%);
	font-weight: 600;
	padding-inline: 1em;
	padding-block: 0.8em;
	text-decoration: none;
	letter-spacing: 1.1px;
	text-align: center; }

card-heading-container > p {
	font-family: "Plus Jakarta Sans";
	font-weight: 600;
	letters-spacing: 1.1px; }

card-heading-container a + p {
	margin-inline-start: 30px; }

card-title {
	line-height: 1.1em;
	font-size: 2.9rem; 
	font-family: "EB Garamond"; 
	font-weight: 700; 
	display: block; 
	text-transform: capitalize; 
	margin-block: 20px;
	color: #000; 
	letter-spacing: -0.8px; }
card-title > a {
	text-decoration: none; }

card-title > a:any-link {
	color: #000; }
card-title a:hover {
	color: hsl(360, 71%, 66%);
	transition-duration: 0.2s;  }
card-container-right > p {
	font-size: 1.125rem; 
	line-height: 1.5em; 
	letter-spacing: 0.02em;
	width: 80%; }

			<card-container>
				<card-container-left>
					<a href="post.html"><pic></pic></a>
					</card-container-left>
				<card-container-right>
					<card-heading-container>
							<a href="">Destinations</a>
							<p>3 Years Ago</p>
					</card-heading-container>
					<card-title><a href="post.html">Override the digital divide with additional clickthroughs from DevOps</a></card-title>
					<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed eu purus eget erat placerat imperdiet. Maecenas a dictum nunc, ut…</p>
				</card-container-right>
			</card-container>


***



HORIZONTAL THREE. COLUMN LAYOUTS
/*  these are the stylings for the related articles thumbnails  */

blog

related-articles-card + related-articles-card {
	margin-block-start: 20px;  }

post-related-articles {
 }
	
post-related-articles-container {
	display: flex;
	flex-direction: row;
	justify-content: space-around; 
	align-items: baseline; }

related-articles-title {
	display: block;
	padding-block-start: 60px;
	padding-block-end: 40px; 
	font-size: 1.75rem;
	font-family: "Source Code Pro";
	font-weight: 700;
	letter-spacing: 1.01px;
	text-align: center; 
	text-transform: uppercase;
	color: hsla(0,0%,0%,0.7);	 }

related-articles-card {
	display: flex;
	flex-direction: column; }
	
related-articles-card-top {
	flex-basis: 80%;
	display: flex;
	flex-direction: center;
	justify-content: center;
	align-items: center; }

related-articles-card-image {
	background-image: url("../images/boss.png");
	background-size: center;
	display: block;
	height: 250px;
	width: 250px; }
	

related-articles-card-bottom {
	text-align: center;
	flex-basis: 20%;
	padding-inline-start: 10px; 
	padding-block-start: 10px; }
	
related-articles-card-title {
	display: block;
	margin-block-end: 10px; 
	font-family: Arial, sans-serif;
	font-size: 0.9rem;
	text-transform: uppercase; 
	font-weight: 600; 
	letter-spacing: 1.01px; }

related-articles-card-meta {
	display: block;
	font-size: 0.8rem; }	




						<post-related-articles>
							<related-articles-title>Related articles</related-articles-title>
								<post-related-articles-container>

									<related-articles-card>
											<related-articles-card-top><related-articles-card-image></related-articles-card-image></related-articles-card-top>
											<related-articles-card-bottom>
												<related-articles-card-title>destinations Package</related-articles-card-title>
												<related-articles-card-meta><span>destinations / </span>January 11, 2000</related-articles-card-meta>
											</related-articles-card-bottom>						
									</related-articles-card>

									<related-articles-card>
											<related-articles-card-top><related-articles-card-image></related-articles-card-image></related-articles-card-top>
											<related-articles-card-bottom>
												<related-articles-card-title>destinations Package</related-articles-card-title>
												<related-articles-card-meta><span>destinations / </span>January 11, 2000</related-articles-card-meta>
											</related-articles-card-bottom>						
									</related-articles-card>

									<related-articles-card>
											<related-articles-card-top><related-articles-card-image></related-articles-card-image></related-articles-card-top>
											<related-articles-card-bottom>
												<related-articles-card-title>destinations Package</related-articles-card-title>
												<related-articles-card-meta><span>destinations / </span>January 11, 2000</related-articles-card-meta>
											</related-articles-card-bottom>						
									</related-articles-card>

								</post-related-articles-container>
						</post-related-articles>