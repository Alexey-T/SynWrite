To translate a plugin (make sure plugin supports the translation API), you need to create lang-files.

Lang-files must be placed in the same folder as plugin files:

* For Python plugins: lang-file names must be "Suffix.lng", where possible values of "Suffix" are listed below.
* For binary plugins: if plugin filename is "Some.dll", then lang-file names must be "Some.Suffix.lng".

  Language | Suffix   
  -------- | ------
  Arabic | Ar
  Chinese Simplified | Chs
  Chinese Traditional | Cht
  Czech | Cz
  Danish | Da 
  Dutch | Dut
  English | En
  Finnish | Fi
  French | Fr
  German | De
  Greek | Gr  
  Hebrew | Heb
  Hungarian | Hu
  Italian | It
  Japanese | Jp
  Korean | Kr
  Norwegian | Nor
  Polish | Pol
  Portuguese | Pt
  Portuguese Brazil | PtBr
  Russian | Ru
  Slovakian | Sk
  Slovenian | Slo
  Spanish | Sp
  Swedish | Sw
  Turkish | Tk
  
Files must have INI format, with UTF-8 encoding. BOM not required, but if you add BOM, make sure you added an empty line at file start.

Files must contain single section "L" with keys list. For example:

    [L]
    id1=Some name
    id2=Some text here

Key names ("id1" and "id2" in the example above) must be "known" to plugin.
