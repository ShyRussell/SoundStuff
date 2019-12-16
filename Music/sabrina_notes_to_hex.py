import csv

def create_dict(notes_file='Notes_to_Cycles.csv'):
    r_dict = {}
    with open(notes_file, mode='r') as csv_file:
        csv_reader = csv.reader(csv_file)
        line_count = 0
        for row in csv_reader:
            r = row[0].split('\t')
            r_dict[r[0]] = r[2]
            #print('Set %s to %s' % (r[0], r[2]))
        return r_dict


def build_note_string(freqs, channel, length, note, bpm=120):
    """
    channel - 1, 2, 3, or 4
    length - w (whole), h (half), q (quarter), e (eighth), s (sixteenth), qt (quarter triplet), et, qd (dotted quarter), hd, etc
    note 'A#1, that sort of thing'
    """
    #first, the opening zeros and the channel
    instr = '00'
    instr = instr + str(channel-1)
    #next, the length. This bit is harder.
    if length[0] == 'w':
        l = (float(120)/bpm) * 64
    elif length[0] == 'h':
        l = (float(120)/bpm) * 32
    elif length[0] == 'q':
        l = (float(120)/bpm) * 16
    elif length[0] == 'e':
        l = (float(120)/bpm) * 8
    elif length[0] == 's':
        l = (float(120)/bpm) * 4
    elif length[0] == 't':
        l = (float(120)/bpm) * 2
    if len(length) == 2: #Just never make it three please
        if length[1] == 't':
            l *= float(2)/3
        elif length[1] == 'd':
            l *= 1.5
    l = hex(int(l)).upper()
    if len(l) > 5:
        print("Toooooo biiiiiig")
        return 'nope'
    else:
        instr = instr + '0'*(2-len(l[2:])) + l[2:]

    #Finally, the frequency.
    period = hex(int(freqs[note])).upper()
    if len(period) > 5:
        print("Toooooo biiiiiig")
        return 'nope'
    else:
        instr = instr + '0'*(3-len(period[2:])) + period[2:]
    return instr

def wait(channel):
    #print(channel)
    return '00' + str(channel-1) + '01000'

def rest(channel, length, bpm=120):
    instr = '00' + str(channel-1)

    if length[0] == 'w':
        l = (float(120)/bpm) * 64
    elif length[0] == 'h':
        l = (float(120)/bpm) * 32
    elif length[0] == 'q':
        l = (float(120)/bpm) * 16
    elif length[0] == 'e':
        l = (float(120)/bpm) * 8
    elif length[0] == 's':
        l = (float(120)/bpm) * 4
    elif length[0] == 't':
        l = (float(120)/bpm) * 2
    if len(length) == 2: #Just never make it three please
        if length[1] == 't':
            l *= float(2)/3
        elif length[1] == 'd':
            l *= 1.5
    l = hex(int(l)).upper()
    if len(l) > 5:
        print("Toooooo biiiiiig")
        return 'nope'
    else:
        instr = instr + '0'*(2-len(l[2:])) + l[2:]

    instr = instr + '001'
    return instr

def start():
    return '00000000'

def end():
    return '11000000'

def build_dat_file(note_list, note_dict, bpm=120):
    f = open('cinderella.dat', mode='w')
    f.write(start() + '\n')
    for note in note_list:

        if len(note) == 3:
            #regular note
            #print(note)
            instr = build_note_string(note_dict, note[0], note[1], note[2], bpm)
            f.write(instr + '\n')
        elif len(note) == 2:
            #rest
            instr = rest(note[0], note[1], bpm)
            f.write(instr + '\n')
        elif len(note) == 1:
            #print("The note is:", note)
            instr = wait(note[0])
            f.write(instr + '\n')
    f.write(end())
    f.close()



notes = create_dict()

zelda_mel = [[1, 'q', 'A#4'], [1], [1, 'q'], [1], [1, 'qt'], [1], [1, 'st', 'A#4'], [1], [1, 'st'], [1], [1, 'st', 'A#4'], [1], [1, 'st'], [1],
      [1, 'st', 'A#4'], [1], [1, 'st'], [1], [1, 'st', 'A#4'], [1], [1, 'st'], [1], [1, 'et', 'A#4'], [1], [1, 'et'], [1], [1, 'st', 'G#4'], [1], [1, 'st'], [1],
      [1, 'q', 'A#4'], [1], [1, 'qt'], [1],
      [1, 'st', 'A#4'], [1], [1, 'st'], [1], [1, 'st', 'A#4'], [1], [1, 'st'], [1], [1, 'st', 'A#4'], [1], [1, 'st'], [1], [1, 'st', 'A#4'], [1], [1, 'st'], [1],
      [1, 'et', 'A#4'], [1], [1, 'et'], [1], [1, 'st', 'G#4'], [1], [1, 'st'], [1], [1, 'q', 'A#4'], [1], [1, 'qt'], [1],
      [1, 'st', 'A#4'], [1], [1, 'st'], [1], [1, 'st', 'A#4'], [1], [1, 'st'], [1], [1, 'st', 'A#4'], [1], [1, 'st'], [1],
      [1, 'st', 'A#4'], [1], [1, 'st'], [1], [1, 'e', 'A#4'], [1],
      [1, 't', 'F4'], [1], [1, 't'], [1], [1, 't', 'F4'], [1], [1, 't'], [1], [1, 'sd', 'F4'], [1], [1, 't'], [1],
      [1, 't', 'F4'], [1], [1, 't'], [1], [1, 't', 'F4'], [1], [1, 't'], [1], [1, 'sd', 'F4'], [1], [1, 't'], [1],
      [1, 't', 'F4'], [1], [1, 't'], [1], [1, 't', 'F4'], [1], [1, 't'], [1], [1, 'sd', 'F4'], [1], [1, 't'], [1], [1, 'e', 'F4'], [1],
      [1, 'q', 'A#4'], [1], [1, 'q', 'F4'], [1], [1, 'ed', 'F4'], [1], [1, 't', 'A#4'], [1], [1, 't'], [1],
      [1, 's', 'A#4'], [1], [1, 's', 'C5'], [1], [1, 's', 'D5'], [1], [1, 's', 'D#5'], [1], [1, 'h', 'F5'], [1],
      [1, 'e'], [1], [1, 'sd', 'F5'], [1], [1, 't'], [1], [1, 'et', 'F5'], [1], [1, 'et', 'F#5'], [1], [1, 'et', 'G#5'], [1],
      [1, 'h', 'A#5'], [1], [1, 'et'], [1], [1, 'st', 'A#5'], [1], [1, 'st'], [1], [1, 'st', 'A#5'], [1], [1, 'st'], [1], [1, 'et', 'A#5'], [1],
      [1, 'et', 'G#5'], [1], [1, 'et', 'F#5'], [1], [1, 'et', 'G#5'], [1], [1, 'et'], [1], [1, 'et', 'F#5'], [1], [1, 'qd', 'F5'], [1],
      [1, 'e'], [1], [1, 'q', 'F5'], [1], [1, 'sd', 'D#5'], [1], [1, 't'], [1], [1, 's', 'D#5'], [1], [1, 's', 'F5'], [1],
      [1, 'h', 'F#5'], [1], [1, 'e', 'F5'], [1], [1, 'e', 'D#5'], [1], [1, 'sd', 'C#5'], [1], [1, 't'], [1], [1, 's', 'C#5'], [1],
      [1, 's', 'D#5'], [1], [1, 'h', 'F5'], [1], [1, 'e', 'D#5'], [1], [1, 'e', 'D5'], [1], [1, 'sd', 'C5'], [1], [1, 't'], [1],
      [1, 's', 'C5'], [1], [1, 's', 'D5'], [1], [1, 'h', 'E5'], [1], [1, 'q', 'G5'], [1], [1, 'q', 'F5'], [1]]

#For mario, use bpm 360
mario_mel = [[1, 'ed', 'E5'], [1], [1, 's'], [1], [1, 'ed', 'E5'], [1], [1, 's'], [1], [1, 'q'], [1], [1, 'q', 'E5'], [1],
[1, 'q'], [1], [1, 'q', 'C5'], [1], [1, 'q', 'E5'], [1], [1, 'q'], [1], [1, 'q', 'G5'], [1], [1, 'hd'], [1], [1, 'q', 'G4'], [1], [1, 'hd'], [1],
[1, 'q', 'C5'], [1], [1, 'h'], [1], [1, 'q', 'G4'], [1], [1, 'h'], [1], [1, 'q', 'E4'], [1], [1, 'h'], [1],
[1, 'q', 'A4'], [1], [1, 'q'], [1], [1, 'q', 'B4'], [1], [1, 'q'], [1], [1, 'q', 'A#4'], [1], [1, 'q', 'A4'], [1], [1, 'q'], [1],
[1, 'ht', 'G4'], [1], [1, 'ht', 'E5'], [1], [1, 'ht', 'G5'], [1], [1, 'q', 'A5'], [1], [1, 'q'], [1], [1, 'q', 'F5'], [1], [1, 'q', 'G5'], [1],
[1, 'q'], [1], [1, 'q', 'E5'], [1], [1, 'q'], [1], [1, 'q', 'C5'], [1], [1, 'q', 'D5'], [1], [1, 'q', 'B4'], [1],
[1, 'h'], [1], [1, 'q', 'C5'], [1], [1, 'h'], [1], [1, 'q', 'G4'], [1], [1, 'h'], [1], [1, 'q', 'E4'], [1], [1, 'h'], [1],
[1, 'q', 'A4'], [1], [1, 'q'], [1], [1, 'q', 'B4'], [1], [1, 'q'], [1], [1, 'q', 'A#4'], [1], [1, 'q', 'A4'], [1], [1, 'q'], [1],
[1, 'ht', 'G4'], [1], [1, 'ht', 'E5'], [1], [1, 'ht', 'G5'], [1], [1, 'q', 'A5'], [1], [1, 'q'], [1], [1, 'q', 'F5'], [1], [1, 'q', 'G5'], [1],
[1, 'q'], [1], [1, 'q', 'E5'], [1], [1, 'q'], [1], [1, 'q', 'C5'], [1], [1, 'q', 'D5'], [1], [1, 'q', 'B4'], [1],
[1, 'w'], [1], [1, 'q', 'G5'], [1], [1, 'q', 'F#5'], [1], [1, 'q', 'F5'],  [1], [1, 'q', 'D#5'], [1],
[1, 'q'], [1], [1, 'q', 'E5'], [1], [1, 'q'], [1], [1, 'q', 'G#4'], [1], [1, 'q', 'A4'], [1], [1, 'q', 'C5'], [1],
[1, 'q'], [1, 'q', 'A4'], [1], [1, 'q', 'C5'], [1], [1, 'q'], [1, 'q', 'A4'], [1], [1, 'q', 'C5'], [1],
[1, 'q', 'D5'], [1], [1, 'h'], [1], [1, 'q', 'G5'], [1], [1, 'q', 'F#5'], [1], [1, 'q', 'F5'],  [1], [1, 'q', 'D#5'], [1],
[1, 'q'], [1], [1, 'q', 'E5'], [1], [1, 'q'], [1], [1, 'q', 'A5'], [1], [1, 'q'], [1], [1, 'ed', 'A5'], [1], [1, 'e'], [1], [1, 'q', 'A5'], [1]]

cinderella_mel_org = [[1, 'qd', 'D4'],[1],[1, 'e', 'D4'],[1], [1, 't'],[1], [1, 'h', 'D4'], [1], [1, 'q', 'C#4'],[1],
[1, 'q', 'D4'],[1],[1, 'hd', 'B4'],[1], [1, 'q', 'F#4'],[1],[1, 'h', 'A4'],[1],[1, 'w', 'G4'],[1],[1, 'qd'],[1],
[1,'hd','D4'],[1],[1, 'q', 'G4'],[1],[1, 'hd', 'D#4'],[1],[1, 'q', 'F#4'],[1],[1, 'w', 'E4'],[1]
]


cinderella_mel = [[1, 'qd', 'D4'],[1],[1, 'e', 'D4'],[1], [1, 't'],[1],
[1, 'h', 'D4'], [2, 'h', 'B4'],[1],[2],
[1, 'q', 'C#4'],[1],[1, 'q', 'D4'],[1],
[1, 'hd', 'B4'],[3, 'hd', 'G3'],[1],[3],
[1, 'q', 'F#4'],[1],

[1, 'h', 'A4'],[2,'q', 'A4'],[2],[2, 'q', 'D4'], [1],[2],
[1, 'w', 'G4'],[2,'q','G4'],[2],[2, 'q', 'D4'], [2],[2,'q','G4'],[2],[2, 'q', 'D4'], [1],[2],
[1, 'qd'],[1],
[1,'hd','D4'],[2,'q','D4'],[2],[2, 'e', 'B3'], [2],[2,'e','C4'],[2],[2, 'q', 'B3'], [1],[2],

[1, 'q', 'G4'],[1],
[1, 'hd', 'D#4'],[2,'q','D#4'],[2],[2, 'e', 'A3'], [2],[2,'e','B3'],[2],[2, 'q', 'A3'], [1],[2],

[1, 'q', 'G4'],[1],
[1, 'w', 'E4'], [3, 'w', 'B3'],[3],[1]


]
#[4, 'q', 'G4'],[3, 'q', 'G3'],[3],[4],
#,[2,'q','E4'],[2],[2, 'q', 'A3'], [2],[2,'q','E4'],[2],[2, 'q', 'G3'], [1],[2]
build_dat_file(cinderella_mel, notes, bpm=120)
