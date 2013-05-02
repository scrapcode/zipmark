# ZipMark

By [Cam Tyler](mailto:codectc@gmail.com)
-------------------------------------

'Cloud' Bookmarking.

- Uses [acts_as_taggable_on](https://github.com/mbleigh/acts-as-taggable-on)

### Javascript (Courtesy of [Google](http://google.com) )

```
javascript:(function(){var%20a=window,b=document,c=encodeURIComponent,d=a.open("http://localhost:3000/marks/new/"+c(b.title)+"/"+c(b.location),"bkmk_popup","left="+((a.screenX||a.screenLeft)+10)+",top="+((a.screenY||a.screenTop)+10)+",height=510px,width=550px,resizable=1,alwaysRaised=1");a.setTimeout(function(){d.focus()},300)})();
```