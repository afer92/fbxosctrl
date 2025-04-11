
# Status

Partly working:
- free.sh -P will load config from yaml file, to Freebox (not saving to db file though)
- free.sh -D will delete db file, then delete all ports on Freebox

# My Notes

Using -j, --archive, --save, --restore arguments result in the following Booleans being set:
    self._ctrl.conf.resp_as_json = True
    self._ctrl.conf.resp_archive = True
    self._ctrl.conf.resp_save = True
    self._ctrl.conf.resp_restore = True

So for example:
    ./fbxosctrl.py -j --pfwd          ==> outputs all port-forwards as json
    ./fbxosctrl.py --save --pfwd      ==> outputs all port-forwards,         and saves to fbxosctrl.db
    ./fbxosctrl.py -j --save --pfwd   ==> outputs all port-forwards as json, and saves to fbxosctrl.db

OK:
  --save               store in archive

?? difference ??
  --archive            read archive
  --restore            restore from archive

