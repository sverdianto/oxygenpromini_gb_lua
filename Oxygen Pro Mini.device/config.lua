
-- Every MIDI event from this device is filtered through this function
function controller_midi_in(midiEvent,portName)
	-- fix the track volume & pan on DAW mode
	-- if midiEvent[0] == 0xBC and midiEvent[1] == 0x25 then
	-- 	return {midi={0xBC,0x21,midiEvent[2]}}
	-- elseif midiEvent[0] == 0xBC and midiEvent[1] == 0x7C then
	-- 	return {midi={0xBC,0x78,midiEvent[2]}}
	-- end
	-- Always use the main port (won't work without this)
	return {midi=midiEvent, inport='USB MIDI'}
end

-- Define the knobs, buttons, etc. of the device
-- This is also used to check if this device is a match (model, manufacturer and/or device inquiry status)
function controller_info()
	return {
		-- model name for this device
		model = 'Oxygen Pro Mini',
		-- manufacturer name for this device
		manufacturer = 'M-Audio',

		preset_name = 'DAW:LOGIC, PRESET:LPGB',

		-- USB information to check for the Oxygen Pro Mini
		usb_vendor_id = 1891,	-- M-Audio
		usb_product_id = 4155,	-- Oxygen Pro Mini

		garageband = true,
		logicprox = true,

		--patchselector = true,

		-- -- All buttons, knobs, keyboard, possible pedals are defined here
		items = {
				-- The default midiType is 'Absolute', it only has to be defined, if it is different
				{name='Pitch Bend', label='Pitch Bend', objectType='Wheel', midi={0xE0,MIDI_MSB,MIDI_LSB}},
				{name='Modulation', label='Modulation', objectType='Wheel', midi={0xB0,0x01,MIDI_LSB}},
				-- {name='Keyboard', label='Oxygen Pro Mini', objectType='Keyboard', midiType='Keyboard', startKey=32, numberKeys=32, midi={0x90,MIDI_Wildcard,MIDI_Wildcard}},

				{name='Sustain Pedal', label='Sustain', objectType='Sustain Pedal', midiType='Momentary', midi={0xB0,0x40,MIDI_LSB}},

				--------------
				-- DAW MODE --
				--------------
				-- Transport controls				
				{name='Rewind', label='Rewind', objectType='Button', midiType='Momentary', midi={0xB0,0x0F,0x0E,0xB0,0x2F,0x41}},
				{name='Forward', label='Forward', objectType='Button', midiType='Momentary', midi={0xB0,0x0F,0x0E,0xB0,0x2F,0x42}},
				{name='Stop', label='Stop', objectType='Button', midiType='Momentary', midi={0xB0,0x0F,0x0E,0xB0,0x2F,0x43}},
				{name='Play', label='Play', objectType='Button', midiType='Momentary', midi={0xB0,0x0F,0x0E,0xB0,0x2F,0x44}},
				{name='Record', label='Record', objectType='Button', midiType='Momentary', midi={0xB0,0x0F,0x0E,0xB0,0x2F,0x45}},
				{name='Cycle', label='Cycle', objectType='Button', midiType='Momentary', midi={0xB0,0x0F,0x0F,0xB0,0x2F,0x43}},

				{name='Prev Track', label='Prev Track', objectType='Button', midiType='Momentary', midi={0xB0,0x0F,0x0D,0xB0,0x2F,0x44}},
				{name='Next Track', label='Next Track', objectType='Button', midiType='Momentary', midi={0xB0,0x0F,0x0D,0xB0,0x2F,0x40}},
 
				-- {name='Record 1', label='Record 1', trackParam=CS_RECORD, midiType='Momentary', midi={0xB0,0x0F,0x00,0xB0,0x2F,0x47}},
				-- {name='Select 1', label='Select 1', trackParam=CS_SELECT, midiType='Momentary', midi={0xB0,0x0F,0x01,0xB0,0x2F,0x47}},
				{name='Mute 1', label='Mute 1', trackParam=CS_MUTE, midiType='Momentary', midi={0xB0,0x0F,0x02,0xB0,0x2F,0x47}},
				{name='Solo 1', label='Solo 1', trackParam=CS_SOLO, midiType='Momentary', midi={0xB0,0x0F,0x03,0xB0,0x2F,0x47}},

				-- {name='M.Volume', label='Volume', master='0', objectType='VFader', midi={0xB0,0x00,MIDI_LSB,0xB0,0x20,MIDI_LSB}},
				

				
				-- Pads
				-- {name='Track 1', label='Track 1', controlID = 1, faderBankTrack = 0, trackParam = CS_SELECT, midiType='Note', midi={0x90,0x24,MIDI_LSB}},
				-- {name='Track 2', label='Track 2', controlID = 2, faderBankTrack = 1, trackParam = CS_SELECT, midiType='Note', midi={0x90,0x25,MIDI_LSB}},
				-- {name='Track 3', label='Track 3', controlID = 3, faderBankTrack = 2, trackParam = CS_SELECT, midiType='Note', midi={0x90,0x26,MIDI_LSB}},
				-- {name='Track 4', label='Track 4', controlID = 4, faderBankTrack = 3, trackParam = CS_SELECT, midiType='Note', midi={0x90,0x27,MIDI_LSB}},

				-----------------
				-- PRESET MODE --
				-----------------
				-- Control Bank 1 (only Bank 1-1 & 1-2 is usable in Preset mode)
				{name='Fader 1', label='Fader 1', objectType='VFader', midi={0xB0,0x21,MIDI_LSB}},
				{name='Fader 2', label='Fader 2', objectType='VFader', midi={0xB0,0x22,MIDI_LSB}},
				{name='Fader 3', label='Fader 3', objectType='VFader', midi={0xB0,0x23,MIDI_LSB}},
				{name='Fader 4', label='Fader 4', objectType='VFader', midi={0xB0,0x24,MIDI_LSB}},
				{name='Fader 5', label='Fader 5', objectType='VFader', midi={0xB0,0x25,MIDI_LSB}},
				{name='Fader 6', label='Fader 6', objectType='VFader', midi={0xB0,0x26,MIDI_LSB}},
				{name='Fader 7', label='Fader 7', objectType='VFader', midi={0xB0,0x27,MIDI_LSB}},
				{name='Fader 8', label='Fader 8', objectType='VFader', midi={0xB0,0x28,MIDI_LSB}},
				{name='Knob 1', label='Knob 1', objectType='Knob', midi={0xB0,0x78,MIDI_LSB}},
				{name='Knob 2', label='Knob 2', objectType='Knob', midi={0xB0,0x79,MIDI_LSB}},
				{name='Knob 3', label='Knob 3', objectType='Knob', midi={0xB0,0x7A,MIDI_LSB}},
				{name='Knob 4', label='Knob 4', objectType='Knob', midi={0xB0,0x7B,MIDI_LSB}},
				{name='Knob 5', label='Knob 5', objectType='Knob', midi={0xB0,0x7C,MIDI_LSB}},
				{name='Knob 6', label='Knob 6', objectType='Knob', midi={0xB0,0x7D,MIDI_LSB}},
				{name='Knob 7', label='Knob 7', objectType='Knob', midi={0xB0,0x7E,MIDI_LSB}},
				{name='Knob 8', label='Knob 8', objectType='Knob', midi={0xB0,0x7F,MIDI_LSB}},

				-- Pads
				-- {name='Pad 1', label='P1', objectType='Drumpad', midiType='Note', midi={0x90,0x24,MIDI_LSB}},
				-- {name='Pad 2', label='P2', objectType='Drumpad', midiType='Note', midi={0x90,0x25,MIDI_LSB}},
				-- {name='Pad 3', label='P3', objectType='Drumpad', midiType='Note', midi={0x90,0x26,MIDI_LSB}},
				-- {name='Pad 4', label='P4', objectType='Drumpad', midiType='Note', midi={0x90,0x27,MIDI_LSB}},
				-- {name='Pad 5', label='P5', objectType='Drumpad', midiType='Note', midi={0x90,0x28,MIDI_LSB}},
				-- {name='Pad 6', label='P6', objectType='Drumpad', midiType='Note', midi={0x90,0x29,MIDI_LSB}},
				-- {name='Pad 7', label='P7', objectType='Drumpad', midiType='Note', midi={0x90,0x2A,MIDI_LSB}},
				-- {name='Pad 8', label='P8', objectType='Drumpad', midiType='Note', midi={0x90,0x2B,MIDI_LSB}},
			},
		}
end