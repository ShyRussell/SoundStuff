### Shy Russell, Sabrina Pereira, Jonah Spicher

## Music Notes Guide

### Command List and Instructions:

 To format the notes in a text file:
 ```text
00000000    #O buffer that would initialize the Notes, required

00CLLFFF    #C- Channel(2 bit binary); LL- Length (2 bit binary); FFF- Frequency(3 bit Hex)
00140320    #Example for channel 2 at the frequency of 320 Hex for a length of a whole

00C01000    #Break between each note, recommended/required for correct note implementation

00CLL001    #Rest, not required

11000000    #End, ends the entire sequence of notes, required
 ```
Notes and Rests needs Breaks when changing channels or at end followed by an end command at the end

Quarter note = 120 beats per minute;
L(Quarter note) = 16 (10)
L(Half note) = 32 (20)
L(Whole note) = 64 (40)
L(Eighth note) = 8 (8)
L(16th) = 4 (4)
L(doted quarter notes) = (18)t
L(doted Eighth note) = 12(C)
L(triplet) = 11, 11, 10 (A, B, B)


### How to Write Music Instructions Example (Including Multiple Channels)
To have two channels play simultaneously, write the instructions for the channels with no breaks in between. After the note instruction, especially if the notes are not of the same length, add breaks in the order of which note ends first to ensure that future notes play correctly. Here is an examples scenario with how to implement it:

Channel 1 plays a note for a duration of a whole note, while channel 2 plays for only a half note. Channel 3 plays a quarter note as soon as channel 2 stops playing. Channel 1 plays a different note for a quarter note after it finishes the whole note.

00000000
00040190
00120320
00101000
00210100
00201000
00001000
00010200
00001000
11000000
