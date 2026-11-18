we will have game.rb, file_reader.rb and file_writer.rb

our game state needs
- the word to be solved
- guesses_remaining (we wont worry about drawing a stick man)
- a function to loop through the solution and guess, can use chars and zip again, and if they dont match replace the letter in guess with _ then we can join that back together to display how close they are to the answer
- track letters guessed so they dont repeat letters

word list class
- needs to be able to open a text file, filter the words to only 5-12 character words then return a random index

save manager class
- needs to be able to read save file to resume game
- needs to be able to write "save data" to file it would need guesses remaining, the word, their most recent guess response -> "a__r_d", and their guessed characters
- can save as a yaml file and treat each as a key with the value being where they left off this would make it very easy to read and reinitialize a new game object

Win and lose conditions (word fully revealed / no guesses left)
Only wrong guesses use up a turn
Input validation: one letter, case handling, already guessed, plus a save command, so valid input is now “a letter or the word save”
The start menu: new game or load. With multiple saves, you need to list them and let the player choose. Also, should a save be deleted after it’s loaded?