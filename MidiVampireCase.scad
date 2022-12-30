MIDI_WIDTH = 19.63;
MIDI_HEIGHT = 19.75;
PCB_WIDTH = 20.45;
PCB_LENGTH = 54.63;
PCB_THICKNESS = 1.6;
SPACER = 5;
AUDIO_JACK_HEIGHT = 5.25;
CASE_THICKNESS = 1;

module Base()
{
    difference()
    {
        cube([PCB_LENGTH + CASE_THICKNESS * 2,
              PCB_WIDTH + CASE_THICKNESS * 2,
              PCB_THICKNESS + SPACER + CASE_THICKNESS]);

        translate([CASE_THICKNESS, CASE_THICKNESS, CASE_THICKNESS])
        cube([PCB_LENGTH,
              PCB_WIDTH,
              PCB_THICKNESS + SPACER]);
    }
}

module GeneralShapeOfTop(topLen, overallLen, width, height, height2)
{
    hull()
    {
        cube([topLen, width, height]);
        cube([overallLen, width, height2]);
    }
}

module Top()
{
    difference()
    {
        GeneralShapeOfTop(10,
                          PCB_LENGTH + CASE_THICKNESS * 2,
                          PCB_WIDTH + CASE_THICKNESS * 2,
                          PCB_THICKNESS + MIDI_HEIGHT + CASE_THICKNESS,
                          AUDIO_JACK_HEIGHT + PCB_THICKNESS + CASE_THICKNESS);

        translate([CASE_THICKNESS, CASE_THICKNESS, 0])
        GeneralShapeOfTop(10,
                          PCB_LENGTH,
                          PCB_WIDTH,
                          PCB_THICKNESS + MIDI_HEIGHT,
                          AUDIO_JACK_HEIGHT + PCB_THICKNESS);

        // Hole for MIDI connector
        translate([-CASE_THICKNESS, CASE_THICKNESS, 0])
        cube([CASE_THICKNESS * 3, MIDI_WIDTH, MIDI_HEIGHT]);
    }
}

Base();

translate([0, 0, 20]) Top();
