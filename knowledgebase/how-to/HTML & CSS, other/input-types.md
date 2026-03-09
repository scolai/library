
    button - <input type="button" value="Add to favorites">
    checkbox - <input type="checkbox" name="scales" checked>
    color - <input type="color" name="head" value="#e66465">
    email - <input type="email" pattern=".+@bigco\.com" size="30" required>
    file - <input type="file" name="avatar" accept="image/png, image/jpeg">
    hidden - <input type="hidden" name="postId" value="34657" />
    number - <input type="number" name="tentacles" min="10" max="100">
    password - <input type="password" id="pass" name="password" minlength="8" required>
    radio - <input type="radio" name="drone" value="huey" checked> Note: Give all same radio the same name.
    range - <input type="range" name="volume" min="0" max="11">
    reset - <input type="reset" value="Reset">
    search - <input type="search" id="site-search" name="q">
    submit - <input type="submit" value="Submit" />
    text - <input type="text" name="name" required minlength="4" maxlength="8" size="10">
    tel - <input type="time" name="time"/>
    time - <input type="time" name="time"/>
    date - <input type="date" name="date"/>


    type -- Indicates the type of input.
    value -- Gives a default value, or in some cases sets a display text (like with type="button").
    required -- Makes this a required field.
    readonly -- Use this to give a displayed field that people can't edit.
    placeholder -- Places text inside the input as an alternative to label or you can use it to show the format.
    checked -- Marks the input as checked if it's a checkbox or radio.
    disabled -- Disables the input so that it can't be interacted with, and usually makes it looks grayed out.
    name -- Links the field to labels, links together radio options, and assigns the name in the form key=value results.
    autocomplete -- Disables or enables autocomplete. You should add this to things like 2FA fields.
