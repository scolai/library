#nav_list ul { list-style-type: none; margin-left: 1.25em; margin-bottom: 1.5em; }
	#nav_list ul li { width: 200px; margin-bottom: .5em; border: 2px solid blue; }
	#nav_list ul li a {
		display: block; 
		padding: .5em 0 .5em 1.5em; 
		text-decoration: none; 
		font-weight: bold; 
		color: blue; }		
	#nav_list ul li a.current { background-color: silver; }
	
	#nav_menu ul { list-style-type: none; padding: 1em 0; text-align: center; border-top: 2px solid black; border-bottom: 2px solid black; }
	#nav_menu ul li { display: inline; padding: 0 1.5em; }
	#nav_menu ul li a { font-weight: bold; color: blue; }
	#nav_menu ul li a.current { text-decoration: none; }
	




	#nav_menu2 ul { list-style-type: none; position:relative; } /* remove bullets, allow submenu positioning */
	/* positions menu horizontally */
	#nav_menu2 ul li { display: inline-block; margin-right: -5px; } 

	/* disables dropdown menu initially, positions aligned with bottom of container ul */
	#nav_menu2 ul ul { display: none; position:absolute; top: 100%; }

	/* displays dropdown list items as vertical block */
	#nav_menu2 ul ul li { display: block; }

	/* enables view of dropdown ul during mouseover of parent ul list. > in case there are more than one dropdown levels */
	#nav_menu2 ul li:hover > ul { display: block; }

	/*  */
	#nav_menu2 > ul::after { content: ""; display: block; } 
	#nav_menu2 ul ul li ul { position:absolute; left:100%; top:0; }
	#nav_menu2 ul li a { 
		text-align: center;
		display: block;
		width: 176px;
		padding: 1em 0;
		text-decoration: none;
		background-color: blue;
		color: white;
		font-weight: bold;
		border-right: 2px solid white; }
	#nav_menu2 ul li a.lastitem ul li ul { left: -100%; }
	#nav_menu2 ul li.lastitem a { width: 178px; }
	#nav_menu2 ul li a.current { color: yellow; }
	#nav_menu2 ul li a:hover, #nav_menu2 ul li a:focus { background-color: gray; }