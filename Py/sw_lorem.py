#
#Lorem Ipsum generator
#Authors: A.Kvichansky, Alexey T.
#License: MIT

from sw import *

def gettext(count, is_para, is_html_tags):
    """
    Must return str: several sentences (space separated. in one long line.) if is_para=False,
    or several paragraphs if is_para=True. Paragraphs are separated with:
    if is_html_tags=True: each paragraph included into <p>...</p> and ended with eol.
    if is_html_tags=False: each paragraph ended with eol+eol.
    eol is ed.get_prop(PROP_EOL).

    Sentences are taken from TEXT, skipping empty lines. If count> number of lines in TEXT,
    sentences must cycle. E.g. if count=32 and number of non-empty lines is 10, all lines
    taken 3 times and 2 lines taken from begin.

    Paragraphs are taken from TEXT. They separated with empty lines.
    """
    eol = ed.get_prop(PROP_EOL)
    _TEXT   = TEXT.strip(chr(10)+chr(13))
    if is_para:
        _TEXT   = _TEXT.replace(chr(13)+chr(10) , chr(10))                  # for all types of EOLs
        _TEXT   = _TEXT.replace(chr(13)         , chr(10))                  # for all types of EOLs
        paras   = _TEXT.split(chr(10)+chr(10))                              # for all types of EOLs
        paras   = [par.replace(chr(10), ' ') for par in paras] # AT
        
        paras   = paras * (count//len(paras)) + paras[: count%len(paras)]
        if is_html_tags:
            paras   = ['<p>'+par+'</p>' for par in paras]
            s = eol.join(paras)
        else:
            s = (eol+eol).join(paras)
    else:
        _TEXT   = _TEXT.replace(chr(13)         , chr(10))                  # for all types of EOLs
        _TEXT   = _TEXT.replace(chr(10)+chr(10) , chr(10))                  # for all types of EOLs
        sents   = _TEXT.split(chr(10))                                      # for all types of EOLs
        sents   = [sent for sent in sents if 0!=len(sent.replace(' ', ''))] # delete sent if blanks only
        sents   = sents * (count//len(sents)) + sents[: count%len(sents)]
        s = ' '.join(sents)
    return s + eol


TEXT___ = """
a1) aaaaa aaaa aaaaaaa.
a2) bbbbbb bbbbbbb bb bbb.

b1- aaaaaa aaaaaaa aaaaaaaa aaaaaa.
b2- bbb bbbb bb.
b3- ccccc cc.
b4- dddd dddd ddd dd.

c1: aaaaaa aa.
c2: bbbbbbbb bbbbbbb bb.
c3: cccccc ccc ccccccccc cccc cc.
"""

TEXT = """
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
Etiam ultricies sagittis orci, nec consequat dolor consequat ac.
Nulla eleifend rutrum semper.
Sed fringilla, ligula eu gravida tempor, quam magna blandit dolor, quis imperdiet sapien erat eu nibh.
Nunc rutrum pulvinar nulla in facilisis.
Quisque feugiat purus in leo condimentum non congue eros consectetur.
Praesent dictum consequat nulla, bibendum rhoncus enim adipiscing et.
Pellentesque mi tellus, ornare id mattis ac, sollicitudin a erat.
Maecenas sit amet vehicula odio.

Donec felis velit, placerat at vulputate a, iaculis vitae nisl.
In a tellus at ligula tempor auctor.
Nam in mi urna, ac fermentum sapien.
Integer sed condimentum neque.
Sed ut est ligula.
Duis ullamcorper libero nec odio euismod in pellentesque libero sagittis.
Nunc aliquet sodales sem a rutrum.
Mauris bibendum, nunc quis interdum feugiat, massa odio hendrerit metus, eget tempor turpis justo quis mauris.
Praesent volutpat gravida dolor, vitae ultrices neque egestas nec.
Aenean quis sapien tortor.
Sed quis sem mollis dui aliquet consequat.
Quisque condimentum tempus rutrum.
Ut at est ac odio fermentum posuere at sed leo.
In dignissim neque sit amet turpis molestie vitae porttitor enim malesuada.

Ut nec diam sapien.
In augue elit, ultrices at mollis non, consectetur vel ante.
Vivamus pellentesque rhoncus porta.
Phasellus ultrices mi sit amet diam sollicitudin faucibus.
Morbi eget sapien et massa dictum condimentum.
Sed feugiat pellentesque velit, vel sollicitudin urna commodo eget.
Sed ut urna augue, at sollicitudin risus.
Nam tincidunt imperdiet tortor at auctor.
Aenean odio elit, tristique ut suscipit id, lobortis tincidunt sem.
Morbi eget justo ut ante mattis mattis.
Nam consequat tincidunt interdum.
Proin interdum urna quis nibh vulputate pellentesque.
Sed nisl eros, tempor vitae luctus nec, commodo iaculis orci.
Quisque ultrices feugiat lacus id tristique.
Sed molestie suscipit dui, at luctus nibh rhoncus sit amet.

Maecenas ac enim arcu, eget faucibus erat.
Lorem ipsum dolor sit amet, consectetur adipiscing elit.
Cras gravida, purus ut accumsan pulvinar, erat nunc ultrices ante, id adipiscing nunc metus vel quam.
Integer lobortis consectetur pellentesque.
Maecenas ac porttitor diam.
Donec ante eros, rutrum non sagittis ullamcorper, semper et ipsum.
Sed neque velit, mattis ac mattis nec, eleifend vitae sapien.
Nam at tortor ut tellus accumsan placerat.
Curabitur commodo facilisis volutpat.
Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.
Vivamus rhoncus lacinia nulla nec imperdiet.
Phasellus consectetur placerat lacus nec tempus.
Sed vitae mi velit.
Nunc scelerisque placerat orci id tempus.
Etiam fermentum posuere magna vel semper.
Vestibulum non nisi et arcu malesuada tristique.

Suspendisse eu mi a diam volutpat placerat nec id justo.
Nulla vitae risus ante.
Sed sed diam tellus, in suscipit felis.
Quisque non dui mi, quis mattis ligula.
Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.
Curabitur vel viverra nunc.
Aliquam ipsum libero, vulputate eget bibendum quis, adipiscing at erat.
Integer sit amet arcu vel est suscipit gravida et vulputate tortor.
Aliquam tincidunt leo nec dui facilisis iaculis.
Suspendisse et dolor mi, at sodales dui.
Nunc consectetur nulla at enim interdum auctor.
Nunc varius pretium risus.
Integer varius, erat sit amet hendrerit egestas, mi elit facilisis ligula, a ultrices justo elit id dui.
Pellentesque interdum aliquet nisi, eu iaculis ipsum dignissim eget.
In in nisl sed eros luctus pellentesque.

Cras augue enim, pellentesque ut posuere luctus, posuere sed ipsum.
Nullam lacus tortor, sodales eu congue lobortis, auctor quis mauris.
Curabitur feugiat placerat lacus, quis ultrices sem venenatis sed.
Suspendisse lacinia lacus nec velit faucibus id dapibus erat pellentesque.
Sed at augue nec eros scelerisque condimentum.
Aenean vulputate, mi et placerat suscipit, eros urna consequat massa, quis lacinia nisl orci vel massa.
Nam sit amet metus et magna adipiscing dignissim vitae in nibh.
Etiam tempus sagittis gravida.
Nam mattis ultricies lectus, ac adipiscing lorem malesuada at.
In iaculis eleifend magna quis volutpat.
Aliquam ligula eros, aliquet id eleifend auctor, dignissim quis lacus.
Pellentesque non fringilla leo.
Etiam nec nibh nec augue egestas commodo sed condimentum metus.
Nulla elementum suscipit adipiscing.

Nunc vestibulum cursus venenatis.
Aliquam mi arcu, cursus ac varius a, egestas in leo.
Nunc et nibh a sem ultricies ullamcorper.
Praesent facilisis metus nec libero vulputate vel suscipit dui facilisis.
Donec convallis volutpat justo vel feugiat.
Ut venenatis bibendum nisi, id consequat elit viverra a.
Fusce eu nunc nec mi malesuada ullamcorper eu vel purus.
Maecenas mauris leo, tempor in posuere in, laoreet nec ante.
Pellentesque rhoncus velit vitae orci viverra ut sollicitudin odio tempus.
Pellentesque ullamcorper pretium nulla eu venenatis.
Pellentesque consequat neque lectus.
Praesent porttitor, turpis in congue semper, ligula risus gravida nisi, id imperdiet velit tortor eget arcu.
Praesent sagittis purus eget diam molestie ut vestibulum nibh ornare.

Nulla tincidunt lacus in mi tincidunt in bibendum nisl volutpat.
Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas.
Pellentesque in turpis et lacus semper porta sit amet et lectus.
Aliquam porta, sem fermentum gravida sodales, ligula sem aliquam metus, ut feugiat ligula quam sed turpis.
In quis ligula vel diam posuere condimentum.
Donec sed mi vel ipsum volutpat malesuada.
Nunc porta faucibus ultricies.
Integer scelerisque quam sit amet elit convallis sed congue dolor tincidunt.
Vestibulum commodo tincidunt volutpat.
Vestibulum feugiat facilisis bibendum.

Fusce ac metus leo.
Phasellus ut lectus eget odio congue iaculis suscipit vitae sapien.
Morbi tristique quam ut felis posuere dignissim.
Aenean euismod laoreet lacus, eu tempor urna bibendum sed.
Sed consequat mi id lacus viverra ac ultrices eros semper.
Sed mattis lobortis porta.
Praesent eget lectus vel quam dignissim semper in in urna.
Morbi eget arcu commodo neque egestas iaculis in quis risus.
Aenean ultrices fringilla leo feugiat dapibus.
Vivamus et dolor leo.
Vivamus ac massa nec purus auctor tempor ac ac diam.
Suspendisse vel dictum elit.
Duis mi ipsum, suscipit quis porta sit amet, elementum eget mauris.
Nulla facilisi.

Phasellus lobortis, augue at molestie lobortis, leo risus mollis nibh, eget elementum arcu enim vitae diam.
Ut convallis dictum nibh.
Nulla facilisi.
Vivamus est nibh, condimentum vitae mollis a, imperdiet sed odio.
In eu sapien at ligula posuere aliquam.
Vestibulum a lobortis dui.
Aenean euismod magna urna, non aliquet purus.
Morbi tincidunt massa placerat dui feugiat sit amet mollis purus tristique.
Morbi turpis diam, imperdiet laoreet ornare et, congue sit amet lacus.
Donec aliquet, nisi viverra placerat bibendum, dolor nulla tristique nisi, ut consequat elit augue vitae arcu.
Cras tempor mauris id nisi pulvinar interdum.
Proin sed elit diam, at vestibulum lectus.
Cras sagittis feugiat nunc, eu fermentum nisl rhoncus vel.

Donec posuere tempor odio vitae porttitor.
Phasellus dignissim nibh vitae felis consequat in mattis leo pretium.
Nullam bibendum, ante sed dapibus vulputate, magna augue adipiscing turpis, quis vestibulum nisi neque nec lacus.
Phasellus tincidunt nibh nec erat pellentesque adipiscing.
Etiam tempus turpis tincidunt quam viverra elementum.
Nullam in arcu a turpis congue hendrerit.
Phasellus pretium, eros sit amet rhoncus viverra, dui lectus imperdiet ante, ultrices suscipit justo enim non leo.
Integer commodo, ipsum eu pellentesque facilisis, nunc tortor accumsan elit, sed molestie nisl mi blandit ligula.
Pellentesque velit mi, tristique a cursus in, aliquam sed felis.
Vestibulum nibh libero, varius at ultricies nec, ullamcorper id purus.
Nam eget aliquet massa.
Integer eros neque, scelerisque eget vulputate a, lobortis id dui.
Duis augue magna, ultricies vitae lacinia et, vehicula congue justo.
Donec metus mauris, pharetra sed molestie ac, facilisis id arcu.

Phasellus vulputate erat placerat massa tincidunt aliquam.
Duis ac metus sed diam fringilla vehicula.
Morbi facilisis erat justo, eget consequat neque.
Mauris enim elit, porttitor quis rutrum vel, hendrerit id lorem.
Maecenas volutpat, velit nec facilisis vestibulum, augue libero malesuada felis, sit amet porttitor elit felis quis magna.
Morbi facilisis dictum metus quis gravida.
Aliquam dapibus, erat eget aliquam tincidunt, magna augue ultrices nunc, non fermentum turpis enim non nulla.
Praesent augue metus, pellentesque et fermentum vitae, tempor quis tortor.
Fusce ac lectus sollicitudin felis pharetra malesuada nec tempor odio.
Suspendisse potenti.
Duis ac pharetra arcu.
Ut et faucibus augue.
Praesent rhoncus arcu sit amet diam volutpat convallis.

Nulla commodo orci vel velit dignissim sollicitudin.
Aliquam eget est massa, vitae vulputate quam.
In pretium tristique lectus, at laoreet lorem feugiat at.
Donec malesuada eros gravida libero gravida laoreet non ut erat.
Aliquam vel vehicula eros.
Integer porttitor lectus eu dui gravida nec tincidunt nisi dignissim.
Nullam dictum porta diam, et vulputate enim lobortis pretium.

Ut fringilla fringilla sapien ac aliquet.
Duis in diam ut eros rutrum sollicitudin vel ut neque.
Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Nullam accumsan sapien a nisi porta elementum.
Duis sed fringilla lorem.
In vitae urna sit amet massa fringilla adipiscing non ut orci.
Nullam tincidunt elit nec erat pulvinar ac rhoncus orci adipiscing.
Nam elementum fringilla egestas.
Phasellus eget mauris et massa auctor pellentesque ut in nisl.
Etiam bibendum laoreet cursus.

Nulla condimentum vehicula malesuada.
Suspendisse semper hendrerit iaculis.
Nullam sit amet metus in metus eleifend viverra.
Maecenas urna est, rutrum sed elementum eget, tincidunt sed dolor.
Etiam eu odio non ligula faucibus imperdiet.
Duis sagittis augue augue.
Maecenas ultricies, tortor a rutrum ullamcorper, mauris tellus rhoncus quam, non vulputate dui nisl cursus tortor.
Vivamus sed risus vel elit malesuada luctus.
Vestibulum et pretium ligula.
Aenean feugiat nibh justo.
Etiam sollicitudin volutpat tellus, ut volutpat ante sagittis nec.
Cras suscipit orci non lacus consectetur eu rutrum mauris elementum.
In hac habitasse platea dictumst.
"""
