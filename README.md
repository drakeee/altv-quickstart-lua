# altv-quickstart-lua
A quick example in Lua which was ported from https://github.com/Stuyk/altv-quickstart

I wanna thank [Stuyk](https://github.com/Stuyk) (give him a follow) for his lots of contribution in the alt:V community.

# Installation

- Download [alt:V Server](https://altv.mp/#/downloads) in Development version with ``Data files``
- Create a new folder and move ``altv-server.exe`` and ``data`` into it
- Create ``server.cfg`` and add this [content](https://wiki.altv.mp/Server.cfg). <br>Remember: into ``resources: [],`` need to be a ``"example"``
- Create ``modules`` folder into the main root and add [lua-module](https://github.com/drakeee/altv-lua-module/releases/)
- Create ``resources`` folder into the main root and add the ``example`` folder downloaded from this repo


# Play

To play go to your altV Client installation folder and edit ``altv.cfg``, change from ``branch: release`` to ``branch: dev``

Extra: adding ``debug: true`` you can use the F8 (Console) and type ``reconnect``
