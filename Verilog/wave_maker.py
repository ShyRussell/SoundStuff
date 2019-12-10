import wave, struct, math, random

sampleRate = 88000
obj = wave.open('sound.wav','w')
obj.setnchannels(1) # mono
obj.setsampwidth(1)
obj.setframerate(sampleRate)

def play_data(w_data):

    for i in range(len(w_data)):
            data = struct.pack('<h', w_data[i%len(w_data)])
            obj.writeframesraw( data )

f = open("sound_out.txt", 'r')
s_list = f.read().split('\n')
data = []
for s in s_list:
    if s != '':
        data.append(int(s))
play_data(data)
