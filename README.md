Sample VAPI file to use *Allegro5* in a vala Program.

First approach to manually doing a vapi file for vala, not complete yet.

Compile the test file with:

valac test.vala --pkg allegro5 --vapidir=. -X -lallegro
