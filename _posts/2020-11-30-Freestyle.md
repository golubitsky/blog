---
tags: music
---

When I was 5, I took piano lessons. When I was 7, our family moved to the USA. Piano lessons stopped. I messed around on a Yamaha PSR-210 keyboard, playing along with the demo songs. In 4th grade I brought home a trombone. It was the largest and loudest instrument demo'd to us. I don't really remember why, maybe it looked cool. At 13 or so I got braces. It was the end of the world. Trombone got much more difficult to play. And painful.

My mom found a teacher at the All-Newton Music School for me. Well, we found him together. I guess she had the idea to find another musical outlet for me. There was the department head, I believe her name was Kate, who showed me MIDI sequencing. I thought it was the coolest thing ever. It seemed incredibly powerful, even with the basic building blocks that Kate layered in via let's say 2 or 3 tracks. And _then_... Dave Harris showed me what we could do. He is a trombonist, arranger, and definitely also a pianist -- he quickly recorded a few bars with multiple instruments, super-hip stuff -- guitars, horns, organ, electric piano, bass, drums. So fast, just off the top of his head. It blew me away. And he could also be my trombone teacher. Incidentally, I remember one of the first programs I ever wrote -- in BASIC. I had used the tone generator on-board our Packard Bell with a 486 processor (this is the days when the original Pentiums were a big deal). The program would beep out an approximation of the main melody in the William Tell Overture. Programming took a backseat to sequencing and composition, and was forgotten.

I studied with Dave until the end of high school. He was also a huge reason I ended up studying Sound Recording Technology in college, which would eventually lead to NWS, MTT, Mahler, and to everything else, I suppose. Our lessons were Tuesday late afternoons, also the day of the week on which records were released. One Tuesday, Green Day's Warning was released. I stood in line at the Newbury Comics either early in the morning or immediately after school and listened to it on the way to the lesson (in a Discman, by this time) -- and was really disappointed. He said "let's talk about what's wrong with it." I remember he thought the stuff I was writing was much more interesting melodically than the trance music that I was always trying to emulate (Paul Oakenfold's Tranceport was huge -- this is in the days of Napster). I think at one point we worked on a Let It Be MIDI sound-alike. Eventually Dave also helped me to get my trombone back up to speed -- good enough to get into the UMass SRT program. At the end of freshman year I switched into piano as my main instrument.

The PSR-210 didn't have MIDI connectivity, so my Dad let me use his ever-so-slightly more advanced Casio -- it had MIDI ports _and_ cheesy sounds. Eventually I outgrew it and got the excellent Roland JV-1010 sound module. This thing had killer sounds, comparatively. You can hear it on one of the last things I wrote -- during an all-nighter for the rough sketch of something called "Eastern" -- which for some reason I later renamed [Evolution](https://soundcloud.com/mikegolubitsky/evolution). I had another one called Worldly Voyage, which was probably the most intricate thing I had ever written. I'm not sure it exists in any form. At one point I suffered some data loss, and in any case it's several hard-drives removed. But somehow this Evolution survived in MP3 form and now lives in the cloud.

By the end of high school, the rest of the setup included a Fatar Studiologic SL-880 controller and, of course, the sequencer -- a musician-friendly program called Freestyle. It was made by MOTU, but since discontinued and/or folded into Digital Performer. As I later came to realize, one of the best things about this sequencer was its built-in support for certain sound modules -- including the JV-1010. The way this worked was that you could connect the MIDI cables to the interface, tell Freestyle "I'm using a JV-1010" and you'd be able to just select patches (sounds) right there in the program. I never wondered how this worked exactly, but it was very, very user-friendly. The way Dave explained it was that Freestyle was good at getting the technical details out of the way so you could focus on the music. Of course all manner of automation was also available.

When I got to college, I took lots of music theory courses, which introduced me to open chord voicings, and also intimidated me. Or I don't know. There were other interests and demands on my time. At any rate, I have since failed to ever meaningfully return to music composition, all these years. Freestyle doesn't work on new computers and I could never figure out any other sequencer or setup.

### What I learned today

Well so but just now I was talking with a friend about music -- Bill Evans, Barry Harris, equal temperament, on-the-fly transposing as a skill for trumpet players in concert band that pianists don't often have to deal with (or do, but for different reasons), "thinking in C major" when playing in a more esoteric key, and also about our common difficulty in getting our technical setups to work for basic recording/sequencing -- and I decided to give it another shot.

The goal? Simply to connect my Motif XS keyboard to Logic Pro in such a way that, in the DAW, I can quickly select patches, record, and playback. It turns out there is a simple, off-the-shelf solution to this problem! No custom MIDI messages required. There is something called a Logic Song file (`*.LSO`) that accomplishes what Freestyle had built-in for the JV-1010. I have a Yamaha Motif XS6, and there is a file for it that someone made! It is [hosted at usa.yamaha.com](https://usa.yamaha.com/support/faq/music_production/7017.html); it says that it hasn't been updated since 2012, so I was a bit skeptical, but it works! I'm going to also save it [here]({{ site.baseurl }}/assets/Logic_MOTIFXSPatch.zip "MOTIFXSPatch") just in case.

- One accesses the settings in the `CMD+O` Environment window.
- The best place to select the patch name seems to be _not_ that window, but just by double-clicking the instrument icon.
  - Track name becomes the double-clicked patch name; sensible.
- Drums are on channel 10, per General MIDI, if I recall.
- `Save As` a project "keeps" the environment file as part of the project.

It's past midnight and I haven't had dinner. That's how these things go.