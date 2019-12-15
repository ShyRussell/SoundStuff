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
        l = (120/bpm) * 64
    elif length[0] == 'h':
        l = (120/bpm) * 32
    elif length[0] == 'q':
        l = (120/bpm) * 16
    elif length[0] == 'e':
        l = (120/bpm) * 8
    elif length[0] == 's':
        l = (120/bpm) * 4
    elif length[0] == 't':
        l = (120/bpm) * 2
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
    return '00' + str(channel-1) + '01000'

def rest(channel, length, bpm=120):
    instr = '00' + str(channel-1)

    if length[0] == 'w':
        l = (120/bpm) * 64
    elif length[0] == 'h':
        l = (120/bpm) * 32
    elif length[0] == 'q':
        l = (120/bpm) * 16
    elif length[0] == 'e':
        l = (120/bpm) * 8
    elif length[0] == 's':
        l = (120/bpm) * 4
    elif length[0] == 't':
        l = (120/bpm) * 2
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

def build_dat_file(note_list, note_dict):
    f = open('notes.dat', mode='w')
    f.write(start() + '\n')
    for note in note_list:
        if len(note) == 3:
            #regular note
            #print(note)
            instr = build_note_string(note_dict, note[0], note[1], note[2])
            f.write(instr + '\n')
        elif len(note) == 2:
            #rest
            instr = rest(note[0], note[1])
            f.write(instr + '\n')
        elif len(note) == 1:
            instr = wait(note[0])
            f.write(instr + '\n')
    f.write(end())
    f.close()



notes = create_dict()
print(notes['A#1'])
instr = build_note_string(notes, 1, 'w', 'C1')
print(instr)
instr = build_note_string(notes, 4, 'h', 'B6')
print(instr)
instr = rest(4, 'q')
print(instr)
instr = wait(3)
print(instr)
zelda_mel = [[1, 'q', 'A#4'], [1], [1, 'q'], [1], [1, 'qt'], [1], [1, 'st', 'A#4'], [1], [1, 'st'], [1], [1, 'st', 'A#4'], [1], [1, 'st'], [1],
      [1, 'st', 'A#4'], [1], [1, 'st'], [1], [1, 'st', 'A#4'], [1], [1, 'st'], [1], [1, 'et', 'A#4'], [1], [1, 'et'], [1], [1, 'st', 'G#4'], [1], [1, 'st'], [1],
      [1, 'q', 'A#4'], [1], [1, 'qt'], [1],
      [1, 'st', 'A#4'], [1], [1, 'st'], [1], [1, 'st', 'A#4'], [1], [1, 'st'], [1], [1, 'st', 'A#4'], [1], [1, 'st'], [1], [1, 'st', 'A#4'], [1], [1, 'st'], [1],
      [1, 'et', 'A#4'], [1], [1, 'et'], [1], [1, 'st', 'G#4'], [1], [1, 'st'], [1], [1, 'q', 'A#4'], [1], [1, 'qt'], [1],
      [1, 'st', 'A#4'], [1], [1, 'st'], [1], [1, 'st', 'A#4'], [1], [1, 'st'], [1], [1, 'st', 'A#4'], [1], [1, 'st'], [1],
      [1, 'st', 'A#4'], [1], [1, 'st'], [1], [1, 'e', 'A#4'], [1],
      [1, 't', 'F4'], [1], [1, 't'], [1], [1, 't', 'F4'], [1], [1, 't'], [1], [1, 'sd', 'F4'], [1], [1, 't'], [1],
      [1, 't', 'F4'], [1], [1, 't'], [1], [1, 't', 'F4'], [1], [1, 't'], [1], [1, 'sd', 'F4'], [1], [1, 't'], [1],
      [1, 't', 'F4'], [1], [1, 't'], [1], [1, 't', 'F4'], [1], [1, 't'], [1], [1, 'sd', 'F4'], [1, 't'], [1], [1, 'e', 'F4'], [1],
      [1, 'q', 'A#4'], [1], [1, 'q', 'F4'], [1], [1, 'ed', 'F4'], [1], [1, 't', 'A#4'], [1], [1, 't'], [1],
      [1, 's', 'A#4'], [1], [1, 's', 'C5'], [1], [1, 's', 'D5'], [1], [1, 's', 'D#5'], [1], [1, 'h', 'F5'], [1],
      [1, 'e'], [1], [1, 'sd', 'F5'], [1], [1, 't'], [1], [1, 'et', 'F5'], [1], [1, 'et', 'F#5'], [1], [1, 'et', 'G#5'], [1],
      [1, 'h', 'A#5'], [1], [1, 'et'], [1], [1, 'st', 'A#5'], [1], [1, 'st'], [1], [1, 'st', 'A#5'], [1], [1, 'st'], [1], [1, 'et', 'A#5'], [1],
      [1, 'et', 'G#5'], [1], [1, 'et', 'F#5'], [1], [1, 'et', 'G#5'], [1], [1, 'et'], [1], [1, 'et', 'F#5'], [1], [1, 'h', 'F5'], [1]]
build_dat_file(zelda_mel, notes)
