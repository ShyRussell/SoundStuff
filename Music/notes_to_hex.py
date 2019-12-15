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

def build_dat_file(note_list, note_dict):
    for note in note_list:
        

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
