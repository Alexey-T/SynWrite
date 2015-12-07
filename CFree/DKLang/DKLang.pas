unit DKLang;

{$INCLUDE TntCompilers.inc}

interface
uses
  Windows, SysUtils, Classes, Contnrs, Masks, TntClasses,
   // TntWideStrings shouldn't be used in BDS 2006+ as those IDEs correctly implement default WideStrings
  {$IFDEF COMPILER_10_UP}
  WideStrings
  {$ELSE}
  TntWideStrings
  {$ENDIF}
  ;

type
   // Error
  EDKLangError = class(Exception);

  TDKLang_Constants = class;

   // A translation state
  TDKLang_TranslationState = (
    dktsUntranslated,    // The value is still untranslated
    dktsAutotranslated); // The value was translated using the Translation Repository and hence the result needs checking
  TDKLang_TranslationStates = set of TDKLang_TranslationState;

   //-------------------------------------------------------------------------------------------------------------------
   // An interface to an object capable of storing its data as a language source strings
   //-------------------------------------------------------------------------------------------------------------------

  IDKLang_LanguageSourceObject = interface(IInterface)
    ['{41861692-AF49-4973-BDA1-0B1375407D29}']
     // Is called just before storing begins. Must return True to allow the storing or False otherwise
    function  CanStore: Boolean;
     // Must append the language source lines (Strings) with its own data. If an entry states intersect with
     //   StateFilter, the entry should be skipped
    procedure StoreLangSource(Strings: TWideStrings; StateFilter: TDKLang_TranslationStates);
     // Prop handlers
    function  GetSectionName: WideString;
     // Props
     // -- The name of the section corresponding to object language source data (without square brackets)
    property SectionName: WideString read GetSectionName;
  end;

   //-------------------------------------------------------------------------------------------------------------------
   // A list of masks capable of testing an arbitrary string for matching. A string is considered matching when it
   //   matches any mask from the list
   //-------------------------------------------------------------------------------------------------------------------

  TDKLang_MaskList = class(TObjectList)
  private
    function GetItems(Index: Integer): TMask;
  public
     // Creates and fills the list from Strings
    constructor Create(MaskStrings: TStrings);
     // Returns True if s matches any mask from the list
    function  Matches(const s: String): Boolean;
     // Props
     // -- Masks by index
    property Items[Index: Integer]: TMask read GetItems; default;
  end;

   //-------------------------------------------------------------------------------------------------------------------
   // A single component property value translation, referred to by ID
   //-------------------------------------------------------------------------------------------------------------------

  PDKLang_PropValueTranslation = ^TDKLang_PropValueTranslation;
  TDKLang_PropValueTranslation = record
    iID:        Integer;                   // An entry ID, form-wide unique and permanent
    wsValue:    WideString;                // The property value translation
    TranStates: TDKLang_TranslationStates; // Translation states
  end;

   //-------------------------------------------------------------------------------------------------------------------
   // List of property value translations for the whole component hierarchy (usually for a single form); a plain list
   //   indexed (and sorted) by ID
   //-------------------------------------------------------------------------------------------------------------------

  TDKLang_CompTranslation = class(TList)
  private
     // Prop storage
    FComponentName: String;
     // Prop handlers
    function  GetItems(Index: Integer): PDKLang_PropValueTranslation;
  protected
    procedure Notify(Ptr: Pointer; Action: TListNotification); override;
  public
    constructor Create(const sComponentName: String);
     // Adds an entry into the list and returns the index of the newly added entry
    function  Add(iID: Integer; const wsValue: WideString; TranStates: TDKLang_TranslationStates): Integer;
     // Returns index of entry by its ID; -1 if not found
    function  IndexOfID(iID: Integer): Integer;
     // Tries to find the entry by property ID; returns True, if succeeded, and its index in iIndex; otherwise returns
     //   False and its adviced insertion-point index in iIndex
    function  FindID(iID: Integer; out iIndex: Integer): Boolean;
     // Returns the property entry for given ID, or nil if not found
    function  FindPropByID(iID: Integer): PDKLang_PropValueTranslation;
     // Props
     // -- Root component's name for which the translations in the list are (form, frame, datamodule etc)
    property ComponentName: String read FComponentName;
     // -- Translations by index
    property Items[Index: Integer]: PDKLang_PropValueTranslation read GetItems; default;
  end;

   //-------------------------------------------------------------------------------------------------------------------
   // List of component translations
   //-------------------------------------------------------------------------------------------------------------------

  TDKLang_CompTranslations = class(TList)
  private
     // Prop storage
    FConstants: TDKLang_Constants;
    FIsStreamUnicode: Boolean;
    FParams: TWideStrings;
     // Callback function for obtaining current language ID
    function  GetLangIDCallback: LANGID;
     // Prop handlers
    function  GetItems(Index: Integer): TDKLang_CompTranslation;
  protected
    procedure Notify(Ptr: Pointer; Action: TListNotification); override;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear; override;
     // Adds an item to the list and returns the index of the newly added entry
    function  Add(Item: TDKLang_CompTranslation): Integer;
     // Returns index of entry by component name; -1 if not found
    function  IndexOfComponentName(const sComponentName: String): Integer;
     // Returns component translation entry by component name; nil if not found
    function  FindComponentName(sComponentName: String): TDKLang_CompTranslation; //AT
     // Stream loading and storing in plaintext (ini-file-like) format. bParamsOnly tells the object to load only the
     //   sectionless parameters and not to load components nor constants. This may be used to evaluate the translation
     //   parameters only (eg. its language)
    procedure Text_LoadFromStream(Stream: TStream; bParamsOnly: Boolean = False);
    procedure Text_SaveToStream(Stream: TStream; bUnicode, bSkipUntranslated: Boolean);
     // File loading in plaintext (ini-file-like) format
    procedure Text_LoadFromFile(const wsFileName: WideString; bParamsOnly: Boolean = False);
     // File storing in plaintext (ini-file-like) format:
     //   bUnicode          - if False, stores the data in ANSI encoding; if True, stores them in Unicode
     //   bSkipUntranslated - if True, untranslated values are eliminated from the file
    procedure Text_SaveToFile(const wsFileName: WideString; bUnicode, bSkipUntranslated: Boolean);
     // Resource loading
    procedure Text_LoadFromResource(Instance: HINST; const wsResName: WideString; bParamsOnly: Boolean = False); overload;
    procedure Text_LoadFromResource(Instance: HINST; iResID: Integer; bParamsOnly: Boolean = False); overload;
     // Props
     // -- Constant entries
    property Constants: TDKLang_Constants read FConstants;
     // -- True if last loading from text file/stream detected that it used Unicode encoding; False if it was ANSI
    property IsStreamUnicode: Boolean read FIsStreamUnicode;
     // -- Component translations by index
    property Items[Index: Integer]: TDKLang_CompTranslation read GetItems; default;
     // -- Simple parameters stored in a translation file BEFORE the first section (ie. sectionless)
    property Params: TWideStrings read FParams;
  end;

   //-------------------------------------------------------------------------------------------------------------------
   // A single component property entry
   //-------------------------------------------------------------------------------------------------------------------

  PDKLang_PropEntry = ^TDKLang_PropEntry;
  TDKLang_PropEntry = record
    iID:            Integer;    // An entry ID, form-wide unique and permanent
    sPropName:      String;     // Component's property name to which the entry is applied
    wsDefLangValue: WideString; // The property's value for the default language, represented as a widestring
    bValidated:     Boolean;    // Validation flag, used internally in TDKLang_CompEntry.UpdateEntries
  end;

   //-------------------------------------------------------------------------------------------------------------------
   // List of property entries (sorted by property name, case-insensitively)
   //-------------------------------------------------------------------------------------------------------------------

  TDKLang_PropEntries = class(TList)
  private
     // Prop handlers
    function  GetItems(Index: Integer): PDKLang_PropEntry;
  protected
    procedure Notify(Ptr: Pointer; Action: TListNotification); override;
     // Resets bValidated flag for each entry
    procedure Invalidate;
     // Deletes all invalid entries
    procedure DeleteInvalidEntries;
     // Returns max property entry ID over the list; 0 if list is empty
    function  GetMaxID: Integer;
  public
     // Add an entry into the list (returns True) or replaces the property value with sDefLangValue if property with
     //   this name already exists (and returns False). Also sets bValidated to True
    function  Add(iID: Integer; const sPropName: String; const wsDefLangValue: WideString): Boolean;
     // Returns index of entry by its ID; -1 if not found
    function  IndexOfID(iID: Integer): Integer;
     // Returns index of entry by property name; -1 if not found
    function  IndexOfPropName(const sPropName: String): Integer;
     // Tries to find the entry by property name; returns True, if succeeded, and its index in iIndex; otherwise returns
     //   False and its adviced insertion-point index in iIndex
    function  FindPropName(const sPropName: String; out iIndex: Integer): Boolean;
     // Returns entry by property name; nil if not found
    function  FindPropByName(const sPropName: String): PDKLang_PropEntry;
     // Stream loading and storing
    procedure LoadFromDFMResource(Stream: TStream);
    procedure SaveToDFMResource(Stream: TStream);
     // Props
     // -- Entries by index
    property Items[Index: Integer]: PDKLang_PropEntry read GetItems; default;
  end;

   //-------------------------------------------------------------------------------------------------------------------
   // Single component entry
   //-------------------------------------------------------------------------------------------------------------------

  TDKLang_CompEntries = class;

  TDKLang_CompEntry = class(TObject)
  private
     // Component property entries
    FPropEntries: TDKLang_PropEntries;
     // Owned component entries
    FOwnedCompEntries: TDKLang_CompEntries;
     // Prop storage
    FName: String;
    FComponent: TComponent;
    FOwner: TDKLang_CompEntry;
     // Recursively calls PropEntries.Invalidate for each component
    procedure InvalidateProps;
     // Returns max property entry ID across all owned components; 0 if list is empty
    function  GetMaxPropEntryID: Integer;
     // Internal recursive update routine
    procedure InternalUpdateEntries(var iFreePropEntryID: Integer; bModifyList, bIgnoreEmptyProps, bIgnoreNonAlphaProps, bIgnoreFontProps: Boolean; IgnoreMasks, StoreMasks: TDKLang_MaskList);
     // Recursively establishes links to components by filling FComponent field with the component reference found by
     //   its Name. Also removes components whose names no longer associated with actually instantiated components.
     //   Required to be called after loading from the stream
    procedure BindComponents(CurComponent: TComponent);
     // Recursively appends property data as a language source format into Strings
    procedure StoreLangSource(Strings: TWideStrings);
     // Prop handlers
    function  GetName: String;
    function  GetComponentNamePath(bIncludeRoot: Boolean): String;
  public
    constructor Create(AOwner: TDKLang_CompEntry);
    destructor Destroy; override;
     // If bModifyList=True, recursively updates (or creates) component hierarchy and component property values,
     //   creating and deleting entries as appropriate. If bModifyList=False, only refreshes the [current=default]
     //   property values
    procedure UpdateEntries(bModifyList, bIgnoreEmptyProps, bIgnoreNonAlphaProps, bIgnoreFontProps: Boolean; IgnoreMasks, StoreMasks: TDKLang_MaskList);
     // Recursively replaces the property values with ones found in Translation; if Translation=nil, applies the default
     //   property values
    procedure ApplyTranslation(Translation: TDKLang_CompTranslation; cCodePage: Cardinal);
     // Stream loading/storing
    procedure LoadFromDFMResource(Stream: TStream);
    procedure SaveToDFMResource(Stream: TStream);
     // Removes the given component by reference, if any; if bRecursive=True, acts recursively
    procedure RemoveComponent(AComponent: TComponent; bRecursive: Boolean);
     // Props
     // -- Reference to the component (nil while loading from the stream)
    property Component: TComponent read FComponent;
     // -- Returns component name path in the form 'owner1.owner2.name'. If bIncludeRoot=False, excludes the top-level
     //    owner name
    property ComponentNamePath[bIncludeRoot: Boolean]: String read GetComponentNamePath;
     // -- Component name in the IDE
    property Name: String read GetName;
     // -- Owner entry, can be nil
    property Owner: TDKLang_CompEntry read FOwner;
  end;

   //-------------------------------------------------------------------------------------------------------------------
   // List of component entries
   //-------------------------------------------------------------------------------------------------------------------

  TDKLang_CompEntries = class(TList)
  private
     // Prop storage
    FOwner: TDKLang_CompEntry;
     // Prop handlers
    function  GetItems(Index: Integer): TDKLang_CompEntry;
  protected
    procedure Notify(Ptr: Pointer; Action: TListNotification); override;
  public
    constructor Create(AOwner: TDKLang_CompEntry);
     // Add an entry into the list; returns the index of the newly added entry
    function  Add(Item: TDKLang_CompEntry): Integer;
     // Returns index of entry by component name; -1 if not found
    function  IndexOfCompName(const sCompName: String): Integer;
     // Returns index of entry by component reference; -1 if not found
    function  IndexOfComponent(CompReference: TComponent): Integer;
     // Returns entry for given component reference; nil if not found
    function  FindComponent(CompReference: TComponent): TDKLang_CompEntry;
     // Stream loading and storing
    procedure LoadFromDFMResource(Stream: TStream);
    procedure SaveToDFMResource(Stream: TStream);
     // Props
     // -- Items by index
    property Items[Index: Integer]: TDKLang_CompEntry read GetItems; default;
     // -- Owner component entry
    property Owner: TDKLang_CompEntry read FOwner;
  end;

   //-------------------------------------------------------------------------------------------------------------------
   // A constant
   //-------------------------------------------------------------------------------------------------------------------

  PDKLang_Constant = ^TDKLang_Constant;
  TDKLang_Constant = record
    sName:      String;                    // Constant name, written obeying standard rules for identifier naming
    wsValue:    WideString;                // Constant value
    wsDefValue: WideString;                // Default constant value (in the default language; initially the same as wsValue)
    TranStates: TDKLang_TranslationStates; // Translation states
  end;

   //-------------------------------------------------------------------------------------------------------------------
   // List of constants (sorted by name, case-insensitively)
   //-------------------------------------------------------------------------------------------------------------------

   // Callback function called when there's a need to determine language of constants being converted from ANSI to
   //   Unicode
  TDKLang_GetLangIDCallback = function: LANGID of object;

  TDKLang_Constants = class(TList, IInterface, IDKLang_LanguageSourceObject)
  private
     // Get language ID callback
    FGetLangIDCallback: TDKLang_GetLangIDCallback;
     // Prop storage
    FAutoSaveLangSource: Boolean;
     // IInterface
    function  QueryInterface(const IID: TGUID; out Obj): HResult; virtual; stdcall;
    function  _AddRef: Integer; stdcall;
    function  _Release: Integer; stdcall;
     // IDKLang_LanguageSourceObject
    function  IDKLang_LanguageSourceObject.CanStore        = LSO_CanStore;
    procedure IDKLang_LanguageSourceObject.StoreLangSource = LSO_StoreLangSource;
    function  IDKLang_LanguageSourceObject.GetSectionName  = LSO_GetSectionName;
    function  LSO_CanStore: Boolean;
    procedure LSO_StoreLangSource(Strings: TWideStrings; StateFilter: TDKLang_TranslationStates);
    function  LSO_GetSectionName: WideString;
     // Prop handlers
    function  GetAsRawString: String;
    function  GetItems(Index: Integer): PDKLang_Constant;
    function  GetItemsByName(const sName: String): PDKLang_Constant;
    function  GetValues(const sName: String): WideString;
    procedure SetAsRawString(const Value: String);
    procedure SetValues(const sName: String; const wsValue: WideString);
  protected
    procedure Notify(Ptr: Pointer; Action: TListNotification); override;
  public
    constructor Create(AGetLangIDCallback: TDKLang_GetLangIDCallback);
     // Add an entry into the list; returns the index of the newly inserted entry
    function  Add(const sName: String; const wsValue: WideString; TranStates: TDKLang_TranslationStates): Integer;
     // Returns index of entry by name; -1 if not found
    function  IndexOfName(const sName: String): Integer;
     // Tries to find the entry by name; returns True, if succeeded, and its index in iIndex; otherwise returns False
     //   and its adviced insertion-point index in iIndex
    function  FindName(const sName: String; out iIndex: Integer): Boolean;
     // Finds the constant by name; returns nil if not found
    function  FindConstName(const sName: String): PDKLang_Constant;
     // Stream loading/storing
    procedure LoadFromStream(Stream: TStream);
    procedure SaveToStream(Stream: TStream);
     // Loads the constants from binary resource with the specified name. Returns True if resource existed, False
     //   otherwise
    function  LoadFromResource(Instance: HINST; const wsResName: WideString): Boolean;
     // Updates the values for existing names from Constants. If Constants=nil, reverts the values to their defaults
     //   (wsDefValue)
    procedure TranslateFrom(Constants: TDKLang_Constants);
     // Props
     // -- Binary list representation as raw data
    property AsRawString: String read GetAsRawString write SetAsRawString;
     // -- If True (default), the list will be automatically saved into the Project's language resource file (*.dklang)
    property AutoSaveLangSource: Boolean read FAutoSaveLangSource write FAutoSaveLangSource;
     // -- Constants by index
    property Items[Index: Integer]: PDKLang_Constant read GetItems; default;
     // -- Constants by name. If no constant of that name exists, an Exception is raised
    property ItemsByName[const sName: String]: PDKLang_Constant read GetItemsByName;
     // -- Constant values, by name. If no constant of that name exists, an Exception is raised
    property Values[const sName: String]: WideString read GetValues write SetValues;
  end;

   //-------------------------------------------------------------------------------------------------------------------
   // Non-visual language controller component
   //-------------------------------------------------------------------------------------------------------------------

   // TDKLanguageController options
  TDKLanguageControllerOption = (
    dklcoAutoSaveLangSource,  // If on, the component will automatically save itself into the Project's language resource file (*.dklang)
    dklcoIgnoreEmptyProps,    // Ignore all properties having no string assigned
    dklcoIgnoreNonAlphaProps, // Ignore all properties with no alpha characters (e.g. with numbers or symbols only); includes dklcoIgnoreEmptyProps behavior
    dklcoIgnoreFontProps);    // Ignore all TFont properties
  TDKLanguageControllerOptions = set of TDKLanguageControllerOption;
const
  DKLang_DefaultControllerOptions = [dklcoAutoSaveLangSource, dklcoIgnoreEmptyProps, dklcoIgnoreNonAlphaProps, dklcoIgnoreFontProps];

type
  TDKLanguageController = class(TComponent, IDKLang_LanguageSourceObject)
  private
     // Prop storage
    FIgnoreList: TStrings;
    FOnLanguageChanged: TNotifyEvent;
    FOnLanguageChanging: TNotifyEvent;
    FOptions: TDKLanguageControllerOptions;
    FRootCompEntry: TDKLang_CompEntry;
    FSectionName: WideString;
    FStoreList: TStrings;
     // Methods for LangData custom property support
    procedure LangData_Load(Stream: TStream);
    procedure LangData_Store(Stream: TStream);
     // IDKLang_LanguageSourceObject
    function  IDKLang_LanguageSourceObject.CanStore        = LSO_CanStore;
    procedure IDKLang_LanguageSourceObject.StoreLangSource = LSO_StoreLangSource;
    function  IDKLang_LanguageSourceObject.GetSectionName  = GetActualSectionName;
    function  LSO_CanStore: Boolean;
    procedure LSO_StoreLangSource(Strings: TWideStrings; StateFilter: TDKLang_TranslationStates);
     // Forces component entries to update their entries. If bModifyList=False, only default property values are
     //   initialized, no entry additions/removes are allowed
    procedure UpdateComponents(bModifyList: Boolean);
     // Prop handlers
    function  GetActualSectionName: WideString;
    procedure SetIgnoreList(Value: TStrings);
    procedure SetStoreList(Value: TStrings);
  protected
    procedure DefineProperties(Filer: TFiler); override;
    procedure Notification(AComponent: TComponent; Operation: TOperation); override;
     // Fires the OnLanguageChanging event
    procedure DoLanguageChanging;
     // Fires the OnLanguageChanged event
    procedure DoLanguageChanged;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure Loaded; override;
     // Props
     // -- Name of a section that is actually used to store and read language data
    property ActualSectionName: WideString read GetActualSectionName;
     // -- The root entry, corresponding to the instance's owner
    property RootCompEntry: TDKLang_CompEntry read FRootCompEntry;
  published
     // -- List of ignored properties
    property IgnoreList: TStrings read FIgnoreList write SetIgnoreList;
     // -- Language controller options
    property Options: TDKLanguageControllerOptions read FOptions write FOptions default DKLang_DefaultControllerOptions;
     // -- Name of a section corresponding to the form or frame served by the controller. If empty (default), Owner's
     //    name is used as section name
    property SectionName: WideString read FSectionName write FSectionName;
     // -- List of forcibly stored properties
    property StoreList: TStrings read FStoreList write SetStoreList;
     // Events
     // -- Fires when language is changed through the LangManager
    property OnLanguageChanging: TNotifyEvent read FOnLanguageChanging write FOnLanguageChanging;
     // -- Fires when language is changed through the LangManager
    property OnLanguageChanged: TNotifyEvent read FOnLanguageChanged write FOnLanguageChanged;
  end;

   //-------------------------------------------------------------------------------------------------------------------
   // A helper language resource list
   //-------------------------------------------------------------------------------------------------------------------

   // Language resource entry kind
  TDKLang_LangResourceKind = (
    dklrkResName, // The entry is a resource addressed by name
    dklrkResID,   // The entry is a resource addressed by ID
    dklrkFile);   // The entry is a translation file

  PDKLang_LangResource = ^TDKLang_LangResource;
  TDKLang_LangResource = record
    Kind:     TDKLang_LangResourceKind; // Entry kind
    Instance: HINST;                    // Instance containing the resource (Kind=[dklrkResName, dklrkResID])
    wsName:   WideString;               // File (Kind=dklrkFile) or resource (Kind=dklrkResName) name
    iResID:   Integer;                  // Resource ID (Kind=dklrkResID)
    wLangID:  LANGID;                   // Language contained in the resource
  end;

  TDKLang_LangResources = class(TList)
  private
    function GetItems(Index: Integer): PDKLang_LangResource;
  protected
    procedure Notify(Ptr: Pointer; Action: TListNotification); override;
  public
    function  Add(Kind: TDKLang_LangResourceKind; Instance: HINST; const wsName: WideString; iResID: Integer; wLangID: LANGID): Integer;
     // Returns the index of entry having the specified LangID; -1 if no such entry
    function  IndexOfLangID(wLangID: LANGID): Integer;
     // Returns the entry having the specified LangID; nil if no such entry
    function  FindLangID(wLangID: LANGID): PDKLang_LangResource;
     // Props
     // -- Items by index
    property Items[Index: Integer]: PDKLang_LangResource read GetItems; default;
  end;

   //-------------------------------------------------------------------------------------------------------------------
   // Global thread-safe language manager class
   //-------------------------------------------------------------------------------------------------------------------

  TDKLanguageManager = class(TObject)
  private
     // Synchronizer object to ensure the thread safety
    FSynchronizer: TMultiReadExclusiveWriteSynchronizer;
     // Internal constants object
    FConstants: TDKLang_Constants;
     // Internal list of language controllers have been created (runtime only)
    FLangControllers: TList;
     // Language resources registered (runtime only)
    FLangResources: TDKLang_LangResources;
     // Prop storage
    FCodePage: Cardinal;
    FDefaultLanguageID: LANGID;
    FLanguageID: LANGID;
     // Applies the specified translation to controllers and constants. Translations=nil means the default language to
     //   be applied
    procedure ApplyTran(Translations: TDKLang_CompTranslations);
     // Applies the specified translation to a single controller. Not a thread-safe method
    procedure UpdateCodePage;
     // Prop handlers
    function  GetConstantValue(const sName: String): WideString;
    function  GetConstantValueA(const sName: String): String;
    function  GetDefaultLanguageID: LANGID;
    function  GetLanguageCount: Integer;
    function  GetLanguageID: LANGID;
    function  GetLanguageIDs(Index: Integer): LANGID;
    function  GetLanguageIndex: Integer;
    function  GetLanguageNames(Index: Integer): WideString;
    function  GetLanguageResources(Index: Integer): PDKLang_LangResource;
    procedure SetDefaultLanguageID(Value: LANGID);
    procedure SetLanguageID(Value: LANGID);
    procedure SetLanguageIndex(Value: Integer);
  protected
     // Internal language controller registration procedures (allowed at runtime only)
    procedure AddLangController(Controller: TDKLanguageController);
    procedure RemoveLangController(Controller: TDKLanguageController);
     // Called by controllers when they are initialized and ready. Applies the currently selected language to the
     //   controller
  public
    constructor Create;
    destructor Destroy; override;
    function  GetTranslationsForLang(wLangID: LANGID): TDKLang_CompTranslations;
     // Updates CodePage in order to match current LanguageID. Not a thread-safe method
    procedure TranslateController(Controller: TDKLanguageController);
    procedure ApplyTranToController(Translations: TDKLang_CompTranslations; Controller: TDKLanguageController);
     // Creates and returns the translations object, or nil if wLangID=DefaultLangID or creation failed. Not a
     //   thread-safe method
     // Registers a translation file for specified language. Returns True if the file was a valid translation file with
     //   language specified. The file replaces any language resource for that language registered before. You can never
     //   replace the DefaultLanguage though
    function  RegisterLangFile(const wsFileName: WideString): Boolean;
     // Register a resource as containing translation data for specified language. The resource replaces any language
     //   resource for that language registered before. You can never replace the DefaultLanguage though
    procedure RegisterLangResource(Instance: HINST; const wsResourceName: WideString; wLangID: LANGID); overload;
    procedure RegisterLangResource(Instance: HINST; iResID: Integer; wLangID: LANGID); overload;
     // Removes language with the specified LangID from the registered language resources list. You cannot remove the
     //   DefaultLanguage
    procedure UnregisterLangResource(wLangID: LANGID);
     // Scans the specified directory for language files using given file mask. If bRecursive=True, also searches in the
     //   subdirectories of sDir. Returns the number of files successfully registered. Examples that scan the
     //   application directory for files with '.lng' extension:
     //     ScanForLangFiles(ExtractFileDir(ParamStr(0)), '*.lng', False); // ANSI version, not always correct
     //     ScanForLangFiles(WideExtractFileDir(WideParamStr(0)), '*.lng', False); // Unicode version, requires Tnt
     //                                                                            // Unicode Controls
    function  ScanForLangFiles(const wsDir, wsMask: WideString; bRecursive: Boolean): Integer;
     // Returns the index of specified LangID, or -1 if not found
    function  IndexOfLanguageID(wLangID: LANGID): Integer;
     // Props
     // -- Code page corresponding to the current value of LanguageID
    property CodePage: Cardinal read FCodePage;
     // -- Constant values by name, Unicode version
    property ConstantValue[const sName: String]: WideString read GetConstantValue;
     // -- Constant values by name, ANSI version
    property ConstantValueA[const sName: String]: String read GetConstantValueA;
     // -- Constant values by name, Unicode version; the same as ConstantValue[]
    property ConstantValueW[const sName: String]: WideString read GetConstantValue;
     // -- Default language ID. The default value is US English ($409)
    property DefaultLanguageID: LANGID read GetDefaultLanguageID write SetDefaultLanguageID;
     // -- Current language ID. Initially equals to DefaultLanguageID. When being changed, affects all the registered
     //    language controllers as well as constants
    property LanguageID: LANGID read GetLanguageID write SetLanguageID;
     // -- Current language index
    property LanguageIndex: Integer read GetLanguageIndex write SetLanguageIndex;
     // -- Number of languages (language resources) registered, including the default language
    property LanguageCount: Integer read GetLanguageCount;
     // -- LangIDs of languages (language resources) registered, index ranged 0 to LanguageCount-1
    property LanguageIDs[Index: Integer]: LANGID read GetLanguageIDs;
     // -- Names of languages (language resources) registered, index ranged 0 to LanguageCount-1, Unicode version only
    property LanguageNames[Index: Integer]: WideString read GetLanguageNames;
     // -- Language resources registered, index ranged 0 to LanguageCount-1. Always nil for Index=0, ie. for default
     //    language
    property LanguageResources[Index: Integer]: PDKLang_LangResource read GetLanguageResources;
  end;

   // Returns the global language manager instance (allowed at runtime only)
  function  LangManager: TDKLanguageManager;

   // Encoding/decoding of control characters in backslashed (escaped) form (CRLF -> \n, TAB -> \t, \ -> \\ etc)
  function  EncodeControlChars(const ws: WideString): WideString; // Raw string -> Escaped string
  function  DecodeControlChars(const ws: WideString): WideString; // Escaped string -> Raw string
   // Finds and updates the corresponding section in Strings (which appear as language source file). If no appropriate
   //   section found, appends the lines to the end of Strings
  procedure UpdateLangSourceStrings(Strings: TWideStrings; LSObject: IDKLang_LanguageSourceObject; StateFilter: TDKLang_TranslationStates);
   // The same as UpdateLangSourceStrings() but operates directly on a language source file. If no such file, a new file
   //   is created
  procedure UpdateLangSourceFile(const wsFileName: WideString; LSObject: IDKLang_LanguageSourceObject; StateFilter: TDKLang_TranslationStates);
   // Raises exception EDKLangError
  procedure DKLangError(const sMsg: String); overload;
  procedure DKLangError(const sMsg: String; const aParams: Array of const); overload;

   // Shortcut to LangManager.ConstantValueW[]
  function  DKLangConstW(const sName: String): WideString; overload;
   // The same, but formats constant value using aParams
  function  DKLangConstW(const sName: String; const aParams: Array of const): WideString; overload;
   // Shortcut to LangManager.ConstantValueA[]
  function  DKLangConstA(const sName: String): String; overload;
   // The same, but formats constant value using aParams
  function  DKLangConstA(const sName: String; const aParams: Array of const): String; overload;

const
   // Version used for saving binary data into streams
  IDKLang_StreamVersion                = 2;

   // Resource name for constant entries in the .res file and executable resources
  SDKLang_ConstResourceName            = 'DKLANG_CONSTS';

   // Section name for constant entries in the language source or translation files
  SDKLang_ConstSectionName             = '$CONSTANTS';

   // Component translations parameter names
  SDKLang_TranParam_LangID             = 'LANGID';
  SDKLang_TranParam_SourceLangID       = 'SourceLANGID';
  SDKLang_TranParam_Author             = 'Author';
  SDKLang_TranParam_Generator          = 'Generator';
  SDKLang_TranParam_LastModified       = 'LastModified';
  SDKLang_TranParam_TargetApplication  = 'TargetApplication';

   // Default language source file extension
  SDKLang_LangSourceExtension          = 'dklang';

  ILangID_USEnglish                    = $0409;

var
   // Set to True by DKLang expert to indicate the design time execution
  IsDesignTime: Boolean = False;

resourcestring
  SDKLangErrMsg_DuplicatePropValueID   = 'Duplicate property value translation ID (%d)';
  SDKLangErrMsg_ErrorLoadingTran       = 'Loading translations failed.'#13#10'Line %d: %s';
  SDKLangErrMsg_InvalidConstName       = 'Invalid constant name ("%s")';
  SDKLangErrMsg_DuplicateConstName     = 'Duplicate constant name ("%s")';
  SDKLangErrMsg_ConstantNotFound       = 'Constant "%s" not found';
  SDKLangErrMsg_LangManagerCalledAtDT  = 'Call to LangManager() is allowed at runtime only';
  SDKLangErrMsg_StreamVersionTooHigh   = 'Stream version (%d) is greater than the current one (%d)';

implementation
uses TypInfo, Math, TntSysUtils, TntSystem;

var
  _LangManager: TDKLanguageManager = nil;

  function LangManager: TDKLanguageManager;
  begin
     // Check that it's a runtime call
    if IsDesignTime then DKLangError(SDKLangErrMsg_LangManagerCalledAtDT);
     // Create _LangManager if needed
    if _LangManager=nil then _LangManager := TDKLanguageManager.Create;
    Result := _LangManager;
  end;

  function EncodeControlChars(const ws: WideString): WideString;
  var
    i, iLen: Integer;
    wc: WideChar;
  begin
    Result := '';
    iLen := Length(ws);
    i := 1;
    while i<=iLen do begin
      wc := ws[i];
      case wc of
         // Tab character
        #9:  Result := Result+'\t';
         // Linefeed character. Skip subsequent Carriage Return char, if any
        #10: begin
          Result := Result+'\n';
          if (i<iLen) and (ws[i+1]=#13) then Inc(i);
        end;
         // Carriage Return character. Skip subsequent Linefeed char, if any
        #13: begin
          Result := Result+'\n';
          if (i<iLen) and (ws[i+1]=#10) then Inc(i);
        end;
         // Backslash. Just duplicate it
        '\': Result := Result+'\\';
         // All control characters having no special names represent as '\00' escape sequence; add directly all others
        else if wc<#32 then Result := Result+WideFormat('\%.2d', [Word(wc)]) else Result := Result+wc;
      end;
      Inc(i);
    end;
  end;

  function DecodeControlChars(const ws: WideString): WideString;
  var
    i, iLen: Integer;
    wc: WideChar;
    bEscape: Boolean;
  begin
    Result := '';
    iLen := Length(ws);
    i := 1;
    while i<=iLen do begin
      wc := ws[i];
      bEscape := False;
      if (wc='\') and (i<iLen) then
        case ws[i+1] of
           // An escaped charcode '\00'
          '0'..'9': if (i<iLen-1) and (ws[i+2] in [WideChar('0')..WideChar('9')]) then begin
            Result := Result+WideChar((Word(ws[i+1])-Word('0'))*10+(Word(ws[i+2])-Word('0')));
            Inc(i, 2);
            bEscape := True;
          end;
          '\': begin
            Result := Result+'\';
            Inc(i);
            bEscape := True;
          end;
          'n': begin
            Result := Result+#13#10;
            Inc(i);
            bEscape := True;
          end;
          't': begin
            Result := Result+#9;
            Inc(i);
            bEscape := True;
          end;
        end;
      if not bEscape then Result := Result+wc;
      Inc(i);
    end;
  end;

  procedure UpdateLangSourceStrings(Strings: TWideStrings; LSObject: IDKLang_LanguageSourceObject; StateFilter: TDKLang_TranslationStates);
  var
    idx, i: Integer;
    wsSectionName: WideString;
    SLLangSrc: TTntStringList;
  begin
    if not LSObject.CanStore then Exit;
    SLLangSrc := TTntStringList.Create;
    try
       // Put section name
      wsSectionName := WideFormat('[%s]', [LSObject.SectionName]);
      SLLangSrc.Add(wsSectionName);
       // Export language source data
      LSObject.StoreLangSource(SLLangSrc, StateFilter);
       // Add empty string
      SLLangSrc.Add('');
       // Lock Strings updates
      Strings.BeginUpdate;
      try
         // Try to find the section
        idx := Strings.IndexOf(wsSectionName);
         // If found
        if idx>=0 then begin
           // Remove all the lines up to the next section
          repeat Strings.Delete(idx) until (idx=Strings.Count) or (Copy(Strings[idx], 1, 1)='[');
           // Insert language source lines into Strings
          for i := 0 to SLLangSrc.Count-1 do begin
            Strings.Insert(idx, SLLangSrc[i]);
            Inc(idx);
          end;
         // Else simply append the language source
        end else
          Strings.AddStrings(SLLangSrc);
      finally
        Strings.EndUpdate;
      end;
    finally
      SLLangSrc.Free;
    end;
  end;

  procedure UpdateLangSourceFile(const wsFileName: WideString; LSObject: IDKLang_LanguageSourceObject; StateFilter: TDKLang_TranslationStates);
  var SLLangSrc: TTntStringList;
  begin
    SLLangSrc := TTntStringList.Create;
    try
       // Load language file source, if any
      if WideFileExists(wsFileName) then SLLangSrc.LoadFromFile(wsFileName);
       // Store the data
      UpdateLangSourceStrings(SLLangSrc, LSObject, StateFilter);
       // Save the language source back into file
      SLLangSrc.SaveToFile(wsFileName);
    finally
      SLLangSrc.Free;
    end;
  end;

  procedure DKLangError(const sMsg: String); overload;

     function RetAddr: Pointer;
     asm
       mov eax, [ebp+4]
     end;

  begin
    raise EDKLangError.Create(sMsg) at RetAddr;
  end;

  procedure DKLangError(const sMsg: String; const aParams: Array of const); overload;

     function RetAddr: Pointer;
     asm
       mov eax, [ebp+4]
     end;

  begin
    raise EDKLangError.CreateFmt(sMsg, aParams) at RetAddr;
  end;

  function DKLangConstW(const sName: String): WideString;
  begin
    Result := LangManager.ConstantValueW[sName];
  end;

  function DKLangConstW(const sName: String; const aParams: Array of const): WideString;
  begin
    Result := WideFormat(DKLangConstW(sName), aParams);
  end;

  function DKLangConstA(const sName: String): String;
  begin
    Result := LangManager.ConstantValueA[sName];
  end;

  function DKLangConstA(const sName: String; const aParams: Array of const): String;
  begin
    Result := Format(DKLangConstA(sName), aParams);
  end;

   //===================================================================================================================
   //  Stream I/O
   //===================================================================================================================
   // Writing

  procedure StreamWriteByte(Stream: TStream; b: Byte);
  begin
    Stream.WriteBuffer(b, 1);
  end;

  procedure StreamWriteWord(Stream: TStream; w: Word);
  begin
    Stream.WriteBuffer(w, 2);
  end;

  procedure StreamWriteInt(Stream: TStream; i: Integer);
  begin
    Stream.WriteBuffer(i, 4);
  end;

  procedure StreamWriteBool(Stream: TStream; b: Boolean);
  begin
    Stream.WriteBuffer(b, 1);
  end;

  procedure StreamWriteStr(Stream: TStream; const s: string);
  var w: Word;
  begin
    w := Length(s);
    Stream.WriteBuffer(w, 2);
    Stream.WriteBuffer(s[1], w);
  end;

  procedure StreamWriteWideStr(Stream: TStream; const ws: WideString);
  var w: Word;
  begin
    w := Length(ws);
    Stream.WriteBuffer(w, 2);
    Stream.WriteBuffer(ws[1], w*2);
  end;

  procedure StreamWriteLine(Stream: TStream; const ws: WideString); overload;
  var wsLn: WideString;
  begin
    wsLn := ws+#13#10;
    Stream.WriteBuffer(wsLn[1], Length(wsLn)*2);
  end;

  procedure StreamWriteLine(Stream: TStream; const s: String); overload;
  var sLn: String;
  begin
    sLn := s+#13#10;
    Stream.WriteBuffer(sLn[1], Length(sLn));
  end;

  procedure StreamWriteLine(Stream: TStream; const ws: WideString; const aParams: Array of const); overload;
  begin
    StreamWriteLine(Stream, WideFormat(ws, aParams));
  end;

   // Writes stream version number
  procedure StreamWriteStreamVersion(Stream: TStream);
  begin
    StreamWriteByte(Stream, IDKLang_StreamVersion);
  end;

   //===================================================================================================================
   // Reading

  function StreamReadByte(Stream: TStream): Byte;
  begin
    Stream.ReadBuffer(Result, 1);
  end;

  function StreamReadWord(Stream: TStream): Word;
  begin
    Stream.ReadBuffer(Result, 2);
  end;

  function StreamReadInt(Stream: TStream): Integer;
  begin
    Stream.ReadBuffer(Result, 4);
  end;

  function StreamReadBool(Stream: TStream): Boolean;
  begin
    Stream.ReadBuffer(Result, 1);
  end;

  function StreamReadStr(Stream: TStream): string;
  var w: Word;
  begin
    w := StreamReadWord(Stream);
    SetLength(Result, w);
    Stream.ReadBuffer(Result[1], w);
  end;

  function StreamReadWideStr(Stream: TStream): WideString;
  var w: Word;
  begin
    w := StreamReadWord(Stream);
    SetLength(Result, w);
    Stream.ReadBuffer(Result[1], w*2);
  end;

   //===================================================================================================================
   // TDKLang_MaskList
   //===================================================================================================================

  constructor TDKLang_MaskList.Create(MaskStrings: TStrings);
  var i: Integer;
  begin
    inherited Create;
    for i := 0 to MaskStrings.Count-1 do Add(TMask.Create(MaskStrings[i]));
  end;

  function TDKLang_MaskList.GetItems(Index: Integer): TMask;
  begin
    Result := TMask(Get(Index));
  end;

  function TDKLang_MaskList.Matches(const s: String): Boolean;
  var i: Integer;
  begin
    for i := 0 to Count-1 do
      if Items[i].Matches(s) then begin
        Result := True;
        Exit;
      end;
    Result := False;
  end;

   //===================================================================================================================
   // TDKLang_CompTranslation
   //===================================================================================================================

  function TDKLang_CompTranslation.Add(iID: Integer; const wsValue: WideString; TranStates: TDKLang_TranslationStates): Integer;
  var p: PDKLang_PropValueTranslation;
  begin
     // Find insertion point and check ID uniqueness
    if FindID(iID, Result) then DKLangError(SDKLangErrMsg_DuplicatePropValueID, [iID]);
     // Create and insert a new entry
    New(p);
    Insert(Result, p);
     // Initialize entry
    p.iID        := iID;
    p.wsValue    := wsValue;
    p.TranStates := TranStates;
  end;

  constructor TDKLang_CompTranslation.Create(const sComponentName: String);
  begin
    inherited Create;
    FComponentName := sComponentName;
  end;

  function TDKLang_CompTranslation.FindID(iID: Integer; out iIndex: Integer): Boolean;
  var iL, iR, i, iItemID: Integer;
  begin
     // Since the list is sorted by ID, implement binary search here
    Result := False;
    iL := 0;
    iR := Count-1;
    while iL<=iR do begin
      i := (iL+iR) shr 1;
      iItemID := GetItems(i).iID;
      if iItemID<iID then
        iL := i+1
      else if iItemID=iID then begin
        Result := True;
        iL := i;
        Break;
      end else
        iR := i-1;
    end;
    iIndex := iL;
  end;

  function TDKLang_CompTranslation.FindPropByID(iID: Integer): PDKLang_PropValueTranslation;
  var idx: Integer;
  begin
    if not FindID(iID, idx) then Result := nil else Result := GetItems(idx);
  end;

  function TDKLang_CompTranslation.GetItems(Index: Integer): PDKLang_PropValueTranslation;
  begin
    Result := Get(Index);
  end;

  function TDKLang_CompTranslation.IndexOfID(iID: Integer): Integer;
  begin
    if not FindID(iID, Result) then Result := -1;
  end;

  procedure TDKLang_CompTranslation.Notify(Ptr: Pointer; Action: TListNotification);
  begin
     // Don't call inherited Notify() here as it does nothing
    if Action=lnDeleted then Dispose(PDKLang_PropValueTranslation(Ptr));
  end;

   //===================================================================================================================
   // TDKLang_CompTranslations
   //===================================================================================================================

  function TDKLang_CompTranslations.Add(Item: TDKLang_CompTranslation): Integer;
  begin
    Result := inherited Add(Item);
  end;

  procedure TDKLang_CompTranslations.Clear;
  begin
    inherited Clear;
     // Clear also parameters and constants
    if FParams<>nil then FParams.Clear;
    if FConstants<>nil then FConstants.Clear;
  end;

  constructor TDKLang_CompTranslations.Create;
  begin
    inherited Create;
    FConstants := TDKLang_Constants.Create(GetLangIDCallback);
    FParams    := TTntStringList.Create;
  end;

  destructor TDKLang_CompTranslations.Destroy;
  begin
    FreeAndNil(FParams);
    FreeAndNil(FConstants);
    inherited Destroy;
  end;

  function TDKLang_CompTranslations.FindComponentName(sComponentName: String): TDKLang_CompTranslation;
  var idx: Integer;
  begin
    //AT- 2 lines added
    idx := Pos('_', sComponentName);
    if idx>0 then System.Delete(sComponentName, idx, MaxInt);

    idx := IndexOfComponentName(sComponentName);
    if idx<0 then Result := nil else Result := GetItems(idx);
  end;

  function TDKLang_CompTranslations.GetItems(Index: Integer): TDKLang_CompTranslation;
  begin
    Result := Get(Index);
  end;

  function TDKLang_CompTranslations.GetLangIDCallback: LANGID;
  begin
    Result := StrToIntDef(Params.Values[SDKLang_TranParam_LangID], ILangID_USEnglish);
  end;

  function TDKLang_CompTranslations.IndexOfComponentName(const sComponentName: String): Integer;
  begin
    for Result := 0 to Count-1 do
      if SameText(GetItems(Result).ComponentName, sComponentName) then Exit;
    Result := -1;
  end;

  procedure TDKLang_CompTranslations.Notify(Ptr: Pointer; Action: TListNotification);
  begin
     // Don't call inherited Notify() here as it does nothing
    if Action=lnDeleted then TDKLang_CompTranslation(Ptr).Free;
  end;

  procedure TDKLang_CompTranslations.Text_LoadFromFile(const wsFileName: WideString; bParamsOnly: Boolean);
  var Stream: TStream;
  begin
    Stream := TTntFileStream.Create(wsFileName, fmOpenRead or fmShareDenyWrite);
    try
      Text_LoadFromStream(Stream, bParamsOnly);
    finally
      Stream.Free;
    end;
  end;

  procedure TDKLang_CompTranslations.Text_LoadFromResource(Instance: HINST; const wsResName: WideString; bParamsOnly: Boolean = False);
  var Stream: TStream;
  begin
    Stream := TTntResourceStream.Create(Instance, wsResName, PWideChar(RT_RCDATA));
    try
      Text_LoadFromStream(Stream, bParamsOnly);
    finally
      Stream.Free;
    end;
  end;

  procedure TDKLang_CompTranslations.Text_LoadFromResource(Instance: HINST; iResID: Integer; bParamsOnly: Boolean = False);
  var Stream: TStream;
  begin
    Stream := TTntResourceStream.CreateFromID(Instance, iResID, PWideChar(RT_RCDATA));
    try
      Text_LoadFromStream(Stream, bParamsOnly);
    finally
      Stream.Free;
    end;
  end;

  procedure TDKLang_CompTranslations.Text_LoadFromStream(Stream: TStream; bParamsOnly: Boolean = False);
  var SL: TTntStringList;

     // Tries to split a line that is neither comment nor section into a name and a value and returns True if succeeded
    function ParseValueLine(const wsLine: WideString; out sName: String; out wsValue: WideString): Boolean;
    var iEqPos: Integer;
    begin
      Result := False;
      iEqPos := Pos('=', wsLine);
      if iEqPos=0 then Exit;
      sName   := Trim(Copy(wsLine, 1, iEqPos-1)); // Convert name to ANSI
      wsValue := Trim(Copy(wsLine, iEqPos+1, MaxInt));
      if sName='' then Exit;
      Result := True;
    end;

     // Extracts and returns the language ID parameter value from the string list, or ILangID_USEnglish if failed
    function RetrieveLangID(List: TTntStringList): LANGID;
    var
      i: Integer;
      sName: String;
      wsValue: WideString;
    begin
      Result := ILangID_USEnglish;
      for i := 0 to List.Count-1 do
        if ParseValueLine(List[i], sName, wsValue) and SameText(sName, SDKLang_TranParam_LangID) then begin
          Result := StrToIntDef(wsValue, ILangID_USEnglish);
          Break;
        end;
    end;

     // Loads List from Stream, either ANSI or Unicode
    procedure LoadStreamIntoStringList(List: TTntStringList);
    var
      i64Pos: Int64;
      cCodePage: Cardinal;
    begin
       // Remember the original stream position
      i64Pos := Stream.Position;
       // Determine whether this is an Unicode source (BEFORE any reading is done)
      FIsStreamUnicode := AutoDetectCharacterSet(Stream)=csUnicode;
      Stream.Position := i64Pos;
       // Load the stream contents into the list
      List.LoadFromStream(Stream);
       // If this is an ANSI stream
      if not FIsStreamUnicode then begin
         // Get code page corresponding to the language from the loaded translations
        cCodePage := LCIDToCodePage(RetrieveLangID(List));
         // Reload the list using this correct code page
        Stream.Position := i64Pos;
        List.AnsiStrings.LoadFromStreamEx(Stream, cCodePage);
      end;
    end;

     // Processes the string list, line by line
    procedure ProcessStringList(List: TTntStringList);
    type
       // A translation part (within the Stream)
      TTranslationPart = (
        tpParam,      // A sectionless (parameter) part
        tpConstant,   // A constant part
        tpComponent); // A component part
    var
      i: Integer;
      wsLine: WideString;
      CT: TDKLang_CompTranslation;
      Part: TTranslationPart;

       // Parses strings starting with '[' and ending with ']'
      procedure ProcessSectionLine(const wsSectionName: WideString);
      begin
         // If it's a constant section
        if WideSameText(wsSectionName, SDKLang_ConstSectionName) then
          Part := tpConstant
         // Else assume this a component name
        else begin
          Part := tpComponent;
           // Try to find the component among previously loaded
          CT := FindComponentName(wsSectionName);
           // If not found, create new
          if CT=nil then begin
            CT := TDKLang_CompTranslation.Create(wsSectionName);
            Add(CT);
          end;
        end;
      end;

       // Parses a value line and applies the value if succeeded
      procedure ProcessValueLine(const wsLine: WideString);
      var
        sName: String;
        wsValue: WideString;
        iID: Integer;
      begin
         // Try to split the line to name and value
        if ParseValueLine(wsLine, sName, wsValue) then
           // Apply the parsed values
          case Part of
            tpParam:    FParams.Values[sName] := wsValue;
            tpConstant: FConstants.Add(sName, DecodeControlChars(wsValue), []);
            tpComponent:
              if CT<>nil then begin
                iID := StrToIntDef(sName, 0);
                if iID>0 then CT.Add(iID, DecodeControlChars(wsValue), []);
              end;
          end;
      end;

    begin
      Part := tpParam; // Initially we're dealing with the sectionless part
      CT := nil;
      for i := 0 to List.Count-1 do begin
        try
          wsLine := Trim(List[i]);
           // Skip empty lines
          if wsLine<>'' then
            case wsLine[1] of
               // A comment
              ';': ;
               // A section
              '[': begin
                if bParamsOnly then Break;
                if (Length(wsLine)>2) and (wsLine[Length(wsLine)]=']') then ProcessSectionLine(Trim(Copy(wsLine, 2, Length(wsLine)-2)));
              end;
               // Probably an entry of form '<Name or ID>=<Value>'
              else ProcessValueLine(wsLine);
            end;
        except
          on e: Exception do DKLangError(SDKLangErrMsg_ErrorLoadingTran, [i, e.Message]);
        end;
      end;
    end;

  begin
     // Clear all the lists
    Clear;
     // Load the stream contents into the string list
    SL := TTntStringList.Create;
    try
      LoadStreamIntoStringList(SL);
       // Parse the list line-by-line
      ProcessStringList(SL);
    finally
      SL.Free;
    end;
  end;

  procedure TDKLang_CompTranslations.Text_SaveToFile(const wsFileName: WideString; bUnicode, bSkipUntranslated: Boolean);
  var
    Stream: TStream;
  begin
    Stream := TTntFileStream.Create(wsFileName, fmCreate);
    try
      Text_SaveToStream(Stream, bUnicode, bSkipUntranslated);
    finally
      Stream.Free;
    end;
  end;

  procedure TDKLang_CompTranslations.Text_SaveToStream(Stream: TStream; bUnicode, bSkipUntranslated: Boolean);
  var cCodePage: Cardinal;

    procedure DoWriteLine(const ws: WideString); overload;
    begin
      if bUnicode then StreamWriteLine(Stream, ws) else StreamWriteLine(Stream, WideStringToStringEx(ws, cCodePage));
    end;

    procedure DoWriteLine(const ws: WideString; const aParams: Array of const); overload;
    begin
      DoWriteLine(WideFormat(ws, aParams));
    end;

    procedure WriteParams;
    var i: Integer;
    begin
      for i := 0 to FParams.Count-1 do DoWriteLine(FParams[i]);
       // Insert an empty line
      if FParams.Count>0 then DoWriteLine('');
    end;

    procedure WriteComponents;
    var
      iComp, iEntry: Integer;
      CT: TDKLang_CompTranslation;
    begin
      for iComp := 0 to Count-1 do begin
        CT := GetItems(iComp);
         // Write component's name
        DoWriteLine('[%s]', [CT.ComponentName]);
         // Write translated values in the form 'ID=Value'
        for iEntry := 0 to CT.Count-1 do
          with CT[iEntry]^ do
            if not bSkipUntranslated or not (dktsUntranslated in TranStates) then
              DoWriteLine('%.8d=%s', [iID, EncodeControlChars(wsValue)]);
         // Insert an empty line
        DoWriteLine('');
      end;
    end;

    procedure WriteConstants;
    var i: Integer;
    begin
       // Write constant section name
      DoWriteLine('[%s]', [SDKLang_ConstSectionName]);
       // Write constant in the form 'Name=Value'
      for i := 0 to FConstants.Count-1 do
        with FConstants[i]^ do
          if not bSkipUntranslated or not (dktsUntranslated in TranStates) then
            DoWriteLine('%s=%s', [sName, EncodeControlChars(wsValue)]);
    end;

  begin
    cCodePage := LCIDToCodePage(GetLangIDCallback);
     // If Unicode saving - mark the stream as Unicode
    if bUnicode then StreamWriteWord(Stream, Word(UNICODE_BOM));
    WriteParams;
    WriteComponents;
    WriteConstants;
  end;

   //===================================================================================================================
   // TDKLang_PropEntries
   //===================================================================================================================

  function TDKLang_PropEntries.Add(iID: Integer; const sPropName: String; const wsDefLangValue: WideString): Boolean;
  var
    p: PDKLang_PropEntry;
    idx: Integer;
  begin
     // Try to find the property by its name
    Result := not FindPropName(sPropName, idx);
     // If not found, create and insert a new entry
    if Result then begin
      New(p);
      Insert(idx, p);
      p.iID       := iID;
      p.sPropName := sPropName;
    end else
      p := GetItems(idx);
     // Assign entry value
    p.wsDefLangValue := wsDefLangValue;
     // Validate the entry
    p.bValidated     := True;
  end;

  procedure TDKLang_PropEntries.DeleteInvalidEntries;
  var i: Integer;
  begin
    for i := Count-1 downto 0 do
      if not GetItems(i).bValidated then Delete(i);
  end;

  function TDKLang_PropEntries.FindPropByName(const sPropName: String): PDKLang_PropEntry;
  var idx: Integer;
  begin
    if FindPropName(sPropName, idx) then Result := GetItems(idx) else Result := nil;
  end;

  function TDKLang_PropEntries.FindPropName(const sPropName: String; out iIndex: Integer): Boolean;
  var iL, iR, i: Integer;
  begin
     // Since the list is sorted by property name, implement binary search here
    Result := False;
    iL := 0;
    iR := Count-1;
    while iL<=iR do begin
      i := (iL+iR) shr 1;
       // Don't use AnsiCompareText() here as property names are allowed to consist of alphanumeric chars and '_' only
      case CompareText(GetItems(i).sPropName, sPropName) of
        Low(Integer)..-1: iL := i+1;
        0: begin
          Result := True;
          iL := i;
          Break;
        end;
        else iR := i-1;
      end;
    end;
    iIndex := iL;
  end;

  function TDKLang_PropEntries.GetItems(Index: Integer): PDKLang_PropEntry;
  begin
    Result := Get(Index);
  end;

  function TDKLang_PropEntries.GetMaxID: Integer;
  var i: Integer;
  begin
    Result := 0;
    for i := 0 to Count-1 do Result := Max(Result, GetItems(i).iID);
  end;

  function TDKLang_PropEntries.IndexOfID(iID: Integer): Integer;
  begin
    for Result := 0 to Count-1 do
      if GetItems(Result).iID=iID then Exit;
    Result := -1;
  end;

  function TDKLang_PropEntries.IndexOfPropName(const sPropName: String): Integer;
  begin
    if not FindPropName(sPropName, Result) then Result := -1;
  end;

  procedure TDKLang_PropEntries.Invalidate;
  var i: Integer;
  begin
    for i := 0 to Count-1 do GetItems(i).bValidated := False;
  end;

  procedure TDKLang_PropEntries.LoadFromDFMResource(Stream: TStream);
  var
    i, iID: Integer;
    sName: String;
  begin
    Clear;
    for i := 0 to StreamReadInt(Stream)-1 do begin
      iID   := StreamReadInt(Stream);
      sName := StreamReadStr(Stream);
      Add(iID, sName, '');
    end;
  end;

  procedure TDKLang_PropEntries.Notify(Ptr: Pointer; Action: TListNotification);
  begin
     // Don't call inherited Notify() here as it does nothing
    if Action=lnDeleted then Dispose(PDKLang_PropEntry(Ptr));
  end;

  procedure TDKLang_PropEntries.SaveToDFMResource(Stream: TStream);
  var
    i: Integer;
    p: PDKLang_PropEntry;
  begin
    StreamWriteInt(Stream, Count);
    for i := 0 to Count-1 do begin
      p := GetItems(i);
      StreamWriteInt(Stream, p.iID);
      StreamWriteStr(Stream, p.sPropName);
    end;
  end;

   //===================================================================================================================
   // TDKLang_CompEntry
   //===================================================================================================================

  procedure TDKLang_CompEntry.ApplyTranslation(Translation: TDKLang_CompTranslation; cCodePage: Cardinal);

     // Applies translations to component's properties
    procedure TranslateProps;

       // Returns translation of a property value in wsTranslation and True if it is present in PropEntries
      function GetTranslationUnicode(const sPropName: String; out wsTranslation: WideString): Boolean;
      var
        PE: PDKLang_PropEntry;
        idxTran: Integer;
      begin
         // Try to locate prop translation entry
        PE := FPropEntries.FindPropByName(sPropName);
        Result := PE<>nil;
        if Result then begin
          wsTranslation := PE.wsDefLangValue;
           // If actual translation is supplied
          if Translation<>nil then begin
             // Try to find the appropriate translation by property entry ID
            idxTran := Translation.IndexOfID(PE.iID);
            if idxTran>=0 then wsTranslation := Translation[idxTran].wsValue;
          end;
        end else
          wsTranslation := '';
      end;

       // The same but return translation in ANSI encoding
      function GetTranslationAnsi(const sPropName: String; out sTranslation: String): Boolean;
      var ws: WideString;
      begin
        Result := GetTranslationUnicode(sPropName, ws);
        sTranslation := WideStringToStringEx(ws, cCodePage);
      end;

      procedure ProcessObject(const sPrefix: String; Instance: TObject); forward;

       // Processes the specified property and adds it to PropEntries if it appears suitable
      procedure ProcessProp(const sPrefix: String; Instance: TObject; pInfo: PPropInfo);
      const asSep: Array[Boolean] of String[1] = ('', '.');
      var
        i: Integer;
        o: TObject;
        sFullName, sTranslation: String;
        wsTranslation: WideString;
      begin
         // Test whether property is to be ignored (don't use IgnoreTest interface here)
        if ((Instance is TComponent) and (pInfo.Name='Name')) or not (pInfo.PropType^.Kind in [tkClass, tkString, tkLString, tkWString]) then Exit;
        sFullName := sPrefix+asSep[sPrefix<>'']+pInfo.Name;
         // Assign the new [translated] value to the property
        case pInfo.PropType^.Kind of
          tkClass:
            if Assigned(pInfo.GetProc) and Assigned(pInfo.SetProc) then begin
              o := GetObjectProp(Instance, pInfo);
              if o<>nil then
                 // TWideStrings property
                if o is TWideStrings then begin
                  if GetTranslationUnicode(sFullName, wsTranslation) then TWideStrings(o).Text := wsTranslation;
                 // TStrings property
                end else if o is TStrings then begin
                  if GetTranslationAnsi(sFullName, sTranslation) then TStrings(o).Text := sTranslation;
                 // TCollection property
                end else if o is TCollection then
                  for i := 0 to TCollection(o).Count-1 do ProcessObject(sFullName+Format('[%d]', [i]), TCollection(o).Items[i])
                 // TPersistent property. Avoid processing TComponent references which may lead to a circular loop
                else if (o is TPersistent) and not (o is TComponent) then
                  ProcessObject(sFullName, o);
            end;
          tkString,
            tkLString: if GetTranslationAnsi(sFullName, sTranslation) then SetStrProp(Instance, pInfo, sTranslation);
            tkWString: if GetTranslationUnicode(sFullName, wsTranslation) then SetWideStrProp(Instance, pInfo, wsTranslation);
        end;
      end;

       // Iterates through Instance's properties and add them to PropEntries. sPrefix is the object name prefix part
      procedure ProcessObject(const sPrefix: String; Instance: TObject);
      var
        i, iPropCnt: Integer;
        pList: PPropList;
      begin
         // Get property list
        iPropCnt := GetPropList(Instance, pList);
         // Iterate thru Instance's properties
        if iPropCnt>0 then
          try
            for i := 0 to iPropCnt-1 do ProcessProp(sPrefix, Instance, pList^[i]);
          finally
            FreeMem(pList);
          end;
      end;

    begin
      if FPropEntries<>nil then ProcessObject('', FComponent);
    end;

     // Recursively applies translations to owned components
    procedure TranslateComponents;
    var i: Integer;
    begin
      if FOwnedCompEntries<>nil then
        for i := 0 to FOwnedCompEntries.Count-1 do FOwnedCompEntries[i].ApplyTranslation(Translation, cCodePage);
    end;

  begin
     // Translate properties
    TranslateProps;
     // Translate owned components
    TranslateComponents;
  end;

  procedure TDKLang_CompEntry.BindComponents(CurComponent: TComponent);
  var
    i: Integer;
    CE: TDKLang_CompEntry;
    c: TComponent;
  begin
    FComponent := CurComponent;
    if FComponent<>nil then begin
      FName := ''; // Free the memory after the link is established
       // Cycle thru component entries
      if FOwnedCompEntries<>nil then begin
        for i := FOwnedCompEntries.Count-1 downto 0 do begin
          CE := FOwnedCompEntries[i];
          if CE.FName<>'' then begin
             // Try to find the component
            c := CurComponent.FindComponent(CE.FName);
             // If not found, delete entry. Recursively call BindComponents() otherwise
            if c=nil then FOwnedCompEntries.Delete(i) else CE.BindComponents(c);
          end;
        end;
         // Destroy the list once it is empty
        if FOwnedCompEntries.Count=0 then FreeAndNil(FOwnedCompEntries);
      end;
    end;
  end;

  constructor TDKLang_CompEntry.Create(AOwner: TDKLang_CompEntry);
  begin
    inherited Create;
    FOwner := AOwner;
  end;

  destructor TDKLang_CompEntry.Destroy;
  begin
    FPropEntries.Free;
    FOwnedCompEntries.Free;
    inherited Destroy;
  end;

  function TDKLang_CompEntry.GetComponentNamePath(bIncludeRoot: Boolean): String;
  begin
    if FOwner=nil then
      if bIncludeRoot then Result := Name else Result := ''
    else begin
      Result := FOwner.ComponentNamePath[bIncludeRoot];
      if Result<>'' then Result := Result+'.';
      Result := Result+Name;
    end;
  end;

  function TDKLang_CompEntry.GetMaxPropEntryID: Integer;
  var i: Integer;
  begin
    if FPropEntries=nil then Result := 0 else Result := FPropEntries.GetMaxID;
    if FOwnedCompEntries<>nil then
      for i := 0 to FOwnedCompEntries.Count-1 do Result := Max(Result, FOwnedCompEntries[i].GetMaxPropEntryID);
  end;

  function TDKLang_CompEntry.GetName: String;
  begin
    if FComponent=nil then Result := FName else Result := FComponent.Name;
  end;

  procedure TDKLang_CompEntry.InternalUpdateEntries(var iFreePropEntryID: Integer; bModifyList, bIgnoreEmptyProps, bIgnoreNonAlphaProps, bIgnoreFontProps: Boolean; IgnoreMasks, StoreMasks: TDKLang_MaskList);
  var sCompPathPrefix: String;

     // Returns True if a property is to be stored according either to its streaming store-flag or to its matching to
     //   StoreMasks
    function IsPropStored(Instance: TObject; pInfo: PPropInfo; const sPropFullName: String): Boolean;
    begin
      Result := IsStoredProp(Instance, pInfo) or StoreMasks.Matches(sPropFullName);
    end;

     // Returns True if a property value is allowed to be stored
    function IsPropValueStored(const sFullPropName: String; const wsPropVal: WideString): Boolean;
    var i: Integer;
    begin
       // Check whether the property value contains localizable characters
      if bIgnoreNonAlphaProps then begin
        Result := False;
        for i := 1 to Length(wsPropVal) do
          case wsPropVal[i] of
            'A'..'Z', 'a'..'z', #161..High(WideChar): begin
              Result := True;
              Break;
            end;
          end;
       // Check for emptiness (no need if bIgnoreNonAlphaProps was True)
      end else if bIgnoreEmptyProps then
        Result := wsPropVal<>''
      else
        Result := True;
    end;

     // Updates the PropEntry value (creates one if needed)
    procedure UpdatePropValue(const sFullPropName: String; const wsPropVal: WideString);
    var p: PDKLang_PropEntry;
    begin
      if IsPropValueStored(sFullPropName, wsPropVal) then
         // If modifications are allowed
        if bModifyList then begin
           // Create PropEntries if needed
          if FPropEntries=nil then FPropEntries := TDKLang_PropEntries.Create;
           // If property is added (rather than replaced), increment the iFreePropEntryID counter; validate the entry
          if FPropEntries.Add(iFreePropEntryID, sFullPropName, wsPropVal) then Inc(iFreePropEntryID);
         // Otherwise only update the value, if any
        end else if FPropEntries<>nil then begin
          p := FPropEntries.FindPropByName(sFullPropName);
          if p<>nil then p.wsDefLangValue := wsPropVal;
        end;
    end;

     // Updates property entries
    procedure UpdateProps;

      procedure ProcessObject(const sPrefix: String; Instance: TObject); forward;

       // Processes the specified property and adds it to PropEntries if it appears suitable
      procedure ProcessProp(const sPrefix: String; Instance: TObject; pInfo: PPropInfo);
      const asSep: Array[Boolean] of String[1] = ('', '.');
      var
        i: Integer;
        o: TObject;
        sPropInCompName, sPropFullName: String;
      begin
        sPropInCompName := sPrefix+asSep[sPrefix<>'']+pInfo.Name;
        sPropFullName   := sCompPathPrefix+sPropInCompName;
         // Test whether property is to be ignored
        if ((Instance is TComponent) and (pInfo.Name='Name')) or
           not (pInfo.PropType^.Kind in [tkClass, tkString, tkLString, tkWString]) or
           IgnoreMasks.Matches(sPropFullName) then Exit;
         // Obtain and store property value
        case pInfo.PropType^.Kind of
          tkClass:
            if Assigned(pInfo.GetProc) and Assigned(pInfo.SetProc) and IsPropStored(Instance, pInfo, sPropFullName) then begin
              o := GetObjectProp(Instance, pInfo);
              if o<>nil then
                 // TWideStrings property
                if o is TWideStrings then
                  UpdatePropValue(sPropInCompName, TWideStrings(o).Text)
                 // TStrings property
                else if o is TStrings then
                  UpdatePropValue(sPropInCompName, TStrings(o).Text)
                 // TCollection property
                else if o is TCollection then
                  for i := 0 to TCollection(o).Count-1 do ProcessObject(sPropInCompName+Format('[%d]', [i]), TCollection(o).Items[i])
                 // TPersistent property. Avoid processing TComponent references which may lead to a circular loop. Also
                 //   filter TFont property values if needed (use name comparison instead of inheritance operator to
                 //   eliminate dependency on Graphics unit)
                else if (o is TPersistent) and not (o is TComponent) and (not bIgnoreFontProps or (o.ClassName<>'TFont')) then
                  ProcessObject(sPropInCompName, o);
            end;
          tkString,
            tkLString: if IsPropStored(Instance, pInfo, sPropFullName) then UpdatePropValue(sPropInCompName, GetStrProp(Instance, pInfo));
          tkWString:   if IsPropStored(Instance, pInfo, sPropFullName) then UpdatePropValue(sPropInCompName, GetWideStrProp(Instance, pInfo));
        end;
      end;

       // Iterates through Instance's properties and add them to PropEntries. sPrefix is the object name prefix part
      procedure ProcessObject(const sPrefix: String; Instance: TObject);
      var
        i, iPropCnt: Integer;
        pList: PPropList;
      begin
         // Get property list
        iPropCnt := GetPropList(Instance, pList);
         // Iterate thru Instance's properties
        if iPropCnt>0 then
          try
            for i := 0 to iPropCnt-1 do ProcessProp(sPrefix, Instance, pList^[i]);
          finally
            FreeMem(pList);
          end;
      end;

    begin
      ProcessObject('', FComponent);
       // Erase all properties not validated yet
      if bModifyList and (FPropEntries<>nil) then begin
        FPropEntries.DeleteInvalidEntries;
         // If property list is empty, erase it
        if FPropEntries.Count=0 then FreeAndNil(FPropEntries);
      end;
    end;

     // Synchronizes component list and updates each component's property entries
    procedure UpdateComponents;
    var
      i: Integer;
      c: TComponent;
      CE: TDKLang_CompEntry;
    begin
      for i := 0 to FComponent.ComponentCount-1 do begin
        c := FComponent.Components[i];
        if (c.Name<>'') and not (c is TDKLanguageController) then begin
           // Try to find the corresponding component entry
          if FOwnedCompEntries=nil then begin
            if bModifyList then FOwnedCompEntries := TDKLang_CompEntries.Create(Self);
            CE := nil;
          end else
            CE := FOwnedCompEntries.FindComponent(c);
           // If not found, and modifications are allowed, create the new entry
          if (CE=nil) and bModifyList then begin
            CE := TDKLang_CompEntry.Create(Self);
            CE.FComponent := c;
            FOwnedCompEntries.Add(CE);
          end;
           // Update the component's property entries
          if CE<>nil then CE.InternalUpdateEntries(iFreePropEntryID, bModifyList, bIgnoreEmptyProps, bIgnoreNonAlphaProps, bIgnoreFontProps, IgnoreMasks, StoreMasks);
        end;
      end;
    end;

  begin
    sCompPathPrefix := ComponentNamePath[False]+'.'; // Root prop names will start with '.'
     // Update property entries
    UpdateProps;
     // Update component entries
    UpdateComponents;
  end;

  procedure TDKLang_CompEntry.InvalidateProps;
  var i: Integer;
  begin
    if FPropEntries<>nil then FPropEntries.Invalidate;
    if FOwnedCompEntries<>nil then
      for i := 0 to FOwnedCompEntries.Count-1 do FOwnedCompEntries[i].InvalidateProps;
  end;

  procedure TDKLang_CompEntry.LoadFromDFMResource(Stream: TStream);
  begin
     // Read component name
    FName := StreamReadStr(Stream);
     // Load props, if any
    if StreamReadBool(Stream) then begin
      if FPropEntries=nil then FPropEntries := TDKLang_PropEntries.Create;
      FPropEntries.LoadFromDFMResource(Stream);
    end;
     // Load owned components, if any (read component existence flag)
    if StreamReadBool(Stream) then begin
      if FOwnedCompEntries=nil then FOwnedCompEntries := TDKLang_CompEntries.Create(Self);
      FOwnedCompEntries.LoadFromDFMResource(Stream);
    end;
  end;

  procedure TDKLang_CompEntry.RemoveComponent(AComponent: TComponent; bRecursive: Boolean);
  var i, idx: Integer;
  begin
    if FOwnedCompEntries<>nil then begin
       // Try to find the component by reference
      idx := FOwnedCompEntries.IndexOfComponent(AComponent);
       // If found, delete it
      if idx>=0 then begin
        FOwnedCompEntries.Delete(idx);
         // Destroy the list once it is empty
        if FOwnedCompEntries.Count=0 then FreeAndNil(FOwnedCompEntries);
      end;
       // The same for owned entries
      if bRecursive and (FOwnedCompEntries<>nil) then
        for i := 0 to FOwnedCompEntries.Count-1 do FOwnedCompEntries[i].RemoveComponent(AComponent, True);
    end;
  end;

  procedure TDKLang_CompEntry.SaveToDFMResource(Stream: TStream);
  begin
     // Save component name
    StreamWriteStr(Stream, Name);
     // Store component properties
    StreamWriteBool(Stream, FPropEntries<>nil);
    if FPropEntries<>nil then FPropEntries.SaveToDFMResource(Stream);
     // Store owned components
    StreamWriteBool(Stream, FOwnedCompEntries<>nil);
    if FOwnedCompEntries<>nil then FOwnedCompEntries.SaveToDFMResource(Stream);
  end;

  procedure TDKLang_CompEntry.StoreLangSource(Strings: TWideStrings);
  var
    i: Integer;
    PE: PDKLang_PropEntry;
    sCompPath: String;
  begin
     // Store the properties
    if FPropEntries<>nil then begin
       // Find the component path, if any
      sCompPath := ComponentNamePath[False];
      if sCompPath<>'' then sCompPath := sCompPath+'.';
       // Iterate through the property entries
      for i := 0 to FPropEntries.Count-1 do begin
        PE := FPropEntries[i];
        Strings.Add(WideFormat('%s%s=%.8d,%s', [sCompPath, PE.sPropName, PE.iID, EncodeControlChars(PE.wsDefLangValue)]));
      end;
    end;
     // Recursively call the method for owned entries
    if FOwnedCompEntries<>nil then
      for i := 0 to FOwnedCompEntries.Count-1 do FOwnedCompEntries[i].StoreLangSource(Strings);
  end;

  procedure TDKLang_CompEntry.UpdateEntries(bModifyList, bIgnoreEmptyProps, bIgnoreNonAlphaProps, bIgnoreFontProps: Boolean; IgnoreMasks, StoreMasks: TDKLang_MaskList);
  var iFreePropEntryID: Integer;
  begin
     // If modifications allowed
    if bModifyList then begin
       // Invalidate all property entries
      InvalidateProps;
       // Compute next free property entry ID
      iFreePropEntryID := GetMaxPropEntryID+1;
    end else
      iFreePropEntryID := 0;
     // Call recursive update routine
    InternalUpdateEntries(iFreePropEntryID, bModifyList, bIgnoreEmptyProps, bIgnoreNonAlphaProps, bIgnoreFontProps, IgnoreMasks, StoreMasks);
  end;

   //===================================================================================================================
   // TDKLang_CompEntries
   //===================================================================================================================

  function TDKLang_CompEntries.Add(Item: TDKLang_CompEntry): Integer;
  begin
    Result := inherited Add(Item);
  end;

  constructor TDKLang_CompEntries.Create(AOwner: TDKLang_CompEntry);
  begin
    inherited Create;
    FOwner := AOwner;
  end;

  function TDKLang_CompEntries.FindComponent(CompReference: TComponent): TDKLang_CompEntry;
  var idx: Integer;
  begin
    idx := IndexOfComponent(CompReference);
    if idx<0 then Result := nil else Result := GetItems(idx);
  end;

  function TDKLang_CompEntries.GetItems(Index: Integer): TDKLang_CompEntry;
  begin
    Result := Get(Index);
  end;

  function TDKLang_CompEntries.IndexOfCompName(const sCompName: String): Integer;
  begin
    for Result := 0 to Count-1 do
       // Don't use AnsiSameText() here as component names are allowed to consist of alphanumeric chars and '_' only
      if SameText(GetItems(Result).Name, sCompName) then Exit;
    Result := -1;
  end;

  function TDKLang_CompEntries.IndexOfComponent(CompReference: TComponent): Integer;
  begin
    for Result := 0 to Count-1 do
      if GetItems(Result).Component=CompReference then Exit;
    Result := -1;
  end;

  procedure TDKLang_CompEntries.LoadFromDFMResource(Stream: TStream);
  var
    i: Integer;
    CE: TDKLang_CompEntry;
  begin
    Clear;
    for i := 0 to StreamReadInt(Stream)-1 do begin
      CE := TDKLang_CompEntry.Create(FOwner);
      Add(CE);
      CE.LoadFromDFMResource(Stream);
    end;
  end;

  procedure TDKLang_CompEntries.Notify(Ptr: Pointer; Action: TListNotification);
  begin
     // Don't call inherited Notify() here as it does nothing
    if Action=lnDeleted then TDKLang_CompEntry(Ptr).Free;
  end;

  procedure TDKLang_CompEntries.SaveToDFMResource(Stream: TStream);
  var i: Integer;
  begin
    StreamWriteInt(Stream, Count);
    for i := 0 to Count-1 do GetItems(i).SaveToDFMResource(Stream);
  end;

   //===================================================================================================================
   // TDKLang_Constants
   //===================================================================================================================

  function TDKLang_Constants.Add(const sName: String; const wsValue: WideString; TranStates: TDKLang_TranslationStates): Integer;
  var p: PDKLang_Constant;
  begin
    if not IsValidIdent(sName) then DKLangError(SDKLangErrMsg_InvalidConstName, [sName]);
     // Find insertion point and check name uniqueness
    if FindName(sName, Result) then DKLangError(SDKLangErrMsg_DuplicateConstName, [sName]);
     // Create and insert a new entry
    New(p);
    Insert(Result, p);
     // Initialize entry
    p.sName      := sName;
    p.wsValue    := wsValue;
    p.wsDefValue := wsValue;
    p.TranStates := TranStates;
  end;

  constructor TDKLang_Constants.Create(AGetLangIDCallback: TDKLang_GetLangIDCallback);
  begin
    inherited Create;
    FAutoSaveLangSource := True;
    FGetLangIDCallback  := AGetLangIDCallback;
  end;

  function TDKLang_Constants.FindConstName(const sName: String): PDKLang_Constant;
  var idx: Integer;
  begin
    if FindName(sName, idx) then Result := GetItems(idx) else Result := nil;
  end;

  function TDKLang_Constants.FindName(const sName: String; out iIndex: Integer): Boolean;
  var iL, iR, i: Integer;
  begin
     // Since the list is sorted by constant name, implement binary search here
    Result := False;
    iL := 0;
    iR := Count-1;
    while iL<=iR do begin
      i := (iL+iR) shr 1;
       // Don't use AnsiCompareText()/WideCompareText() here as constant names are allowed to consist of alphanumeric
       //   chars and '_' only
      case CompareText(GetItems(i).sName, sName) of
        Low(Integer)..-1: iL := i+1;
        0: begin
          Result := True;
          iL := i;
          Break;
        end;
        else iR := i-1;
      end;
    end;
    iIndex := iL;
  end;

  function TDKLang_Constants.GetAsRawString: String;
  var Stream: TStringStream;
  begin
    Stream := TStringStream.Create('');
    try
      SaveToStream(Stream);
      Result := Stream.DataString;
    finally
      Stream.Free;
    end;
  end;

  function TDKLang_Constants.GetItems(Index: Integer): PDKLang_Constant;
  begin
    Result := Get(Index);
  end;

  function TDKLang_Constants.GetItemsByName(const sName: String): PDKLang_Constant;
  var idx: Integer;
  begin
    if not FindName(sName, idx) then DKLangError(SDKLangErrMsg_ConstantNotFound, [sName]);
    Result := GetItems(idx);
  end;

  function TDKLang_Constants.GetValues(const sName: String): WideString;
  begin
    Result := ItemsByName[sName].wsValue;
  end;

  function TDKLang_Constants.IndexOfName(const sName: String): Integer;
  begin
    if not FindName(sName, Result) then Result := -1;
  end;

  function TDKLang_Constants.LoadFromResource(Instance: HINST; const wsResName: WideString): Boolean;
  var Stream: TStream;
  begin
     // Check resource existence
    Result := FindResourceW(Instance, PWideChar(wsResName), PWideChar(RT_RCDATA))<>0;
     // If succeeded, load the list from resource
    if Result then begin
      Stream := TTntResourceStream.Create(Instance, wsResName, PWideChar(RT_RCDATA));
      try
        LoadFromStream(Stream);
      finally
        Stream.Free;
      end;
    end;
  end;

  procedure TDKLang_Constants.LoadFromStream(Stream: TStream);
  var b: Byte;

     // Implements loading from stream of version 1
    procedure Load_v1(bAutoSaveLangSource: Boolean);
    var
      i: Integer;
      sName: String;
      wsValue: WideString;
      cCodePage: Cardinal;
    begin
      cCodePage := LCIDToCodePage(FGetLangIDCallback);
       // AutoSaveLangSource is already read (while determining stream version)
      FAutoSaveLangSource := bAutoSaveLangSource;
       // Read item count, then read the constant names and values
      for i := 0 to StreamReadInt(Stream)-1 do begin
        sName   := StreamReadStr(Stream);
        wsValue := StringToWideStringEx(StreamReadStr(Stream), cCodePage);
        Add(sName, wsValue, []);
      end;
    end;

     // Implements loading from stream of version 2
    procedure Load_v2;
    var
      i: Integer;
      sName: String;
      wsValue: WideString;
    begin
       // Read props
      FAutoSaveLangSource := StreamReadBool(Stream);
       // Read item count, then read the constant names and values
      for i := 0 to StreamReadInt(Stream)-1 do begin
        sName   := StreamReadStr    (Stream);
        wsValue := StreamReadWideStr(Stream);
        Add(sName, wsValue, []);
      end;
    end;

  begin
     // Clear the list
    Clear;
     // Read the first byte of the stream
    b := StreamReadByte(Stream);
    case b of
       // If it is 0 or 1, we're dealing with the very first version of the stream, and b is just boolean
       //   AutoSaveLangSource flag
      0, 1: Load_v1(b<>0);
      2:    Load_v2;
      else  DKLangError(SDKLangErrMsg_StreamVersionTooHigh, [b, IDKLang_StreamVersion]);
    end;
  end;

  function TDKLang_Constants.LSO_CanStore: Boolean;
  begin
    Result := True;
  end;

  function TDKLang_Constants.LSO_GetSectionName: WideString;
  begin
     // Constants always use the predefined section name
    Result := SDKLang_ConstSectionName;
  end;

  procedure TDKLang_Constants.LSO_StoreLangSource(Strings: TWideStrings; StateFilter: TDKLang_TranslationStates);
  var i: Integer;
  begin
    for i := 0 to Count-1 do
      with GetItems(i)^ do
        if TranStates*StateFilter=[] then Strings.Add(sName+'='+EncodeControlChars(wsValue));
  end;

  procedure TDKLang_Constants.Notify(Ptr: Pointer; Action: TListNotification);
  begin
     // Don't call inherited Notify() here as it does nothing
    if Action=lnDeleted then Dispose(PDKLang_Constant(Ptr));
  end;

  function TDKLang_Constants.QueryInterface(const IID: TGUID; out Obj): HResult;
  begin
    if GetInterface(IID, Obj) then Result := S_OK else Result := E_NOINTERFACE;
  end;

  procedure TDKLang_Constants.SaveToStream(Stream: TStream);
  var
    i: Integer;
    p: PDKLang_Constant;
  begin
     // Write the stream version
    StreamWriteStreamVersion(Stream);
     // Store props
    StreamWriteBool(Stream, FAutoSaveLangSource);
     // Store count
    StreamWriteInt(Stream, Count);
     // Store the constants
    for i := 0 to Count-1 do begin
      p := GetItems(i);
      StreamWriteStr    (Stream, p.sName);
      StreamWriteWideStr(Stream, p.wsValue);
    end;
  end;

  procedure TDKLang_Constants.SetAsRawString(const Value: String);
  var Stream: TStringStream;
  begin
    Stream := TStringStream.Create(Value);
    try
      LoadFromStream(Stream);
    finally
      Stream.Free;
    end;
  end;

  procedure TDKLang_Constants.SetValues(const sName: String; const wsValue: WideString);
  begin
    ItemsByName[sName].wsValue := wsValue;
  end;

  procedure TDKLang_Constants.TranslateFrom(Constants: TDKLang_Constants);
  var
    i, idx: Integer;
    pc: PDKLang_Constant;
  begin
    for i := 0 to Count-1 do begin
      pc := GetItems(i);
       // If Constants=nil this means reverting to defaults
      if Constants=nil then pc.wsValue := pc.wsDefValue
       // Else try to find the constant in Constants. Update the value if found
      else if Constants.FindName(pc.sName, idx) then pc.wsValue := Constants[idx].wsValue;
    end;
  end;

  function TDKLang_Constants._AddRef: Integer;
  begin
     // No refcounting applicable
    Result := -1;
  end;

  function TDKLang_Constants._Release: Integer;
  begin
     // No refcounting applicable
    Result := -1;
  end;

   //===================================================================================================================
   // TDKLanguageController
   //===================================================================================================================

  constructor TDKLanguageController.Create(AOwner: TComponent);
  begin
    inherited Create(AOwner);
     // Initialize IgnoreList
    FIgnoreList := TStringList.Create;
    TStringList(FIgnoreList).Duplicates := dupIgnore;
    TStringList(FIgnoreList).Sorted     := True;
     // Initialize StoreList
    FStoreList := TStringList.Create;
    TStringList(FStoreList).Duplicates := dupIgnore;
    TStringList(FStoreList).Sorted     := True;
     // Initialize other props
    FRootCompEntry := TDKLang_CompEntry.Create(nil);
    FOptions       := DKLang_DefaultControllerOptions;
    if not (csLoading in ComponentState) then FRootCompEntry.BindComponents(Owner);
    if not (csDesigning in ComponentState) then LangManager.AddLangController(Self);
  end;

  procedure TDKLanguageController.DefineProperties(Filer: TFiler);

    function DoStore: Boolean;
    begin
      Result := (FRootCompEntry.Component<>nil) and (FRootCompEntry.Component.Name<>'');
    end;

  begin
    inherited DefineProperties(Filer);
    Filer.DefineBinaryProperty('LangData', LangData_Load, LangData_Store, DoStore);
  end;

  destructor TDKLanguageController.Destroy;
  begin
    if not (csDesigning in ComponentState) then LangManager.RemoveLangController(Self);
    FRootCompEntry.Free;
    FIgnoreList.Free;
    FStoreList.Free;
    inherited Destroy;
  end;

  procedure TDKLanguageController.DoLanguageChanged;
  begin
    if Assigned(FOnLanguageChanged) then FOnLanguageChanged(Self);
  end;

  procedure TDKLanguageController.DoLanguageChanging;
  begin
    if Assigned(FOnLanguageChanging) then FOnLanguageChanging(Self);
  end;

  function TDKLanguageController.GetActualSectionName: WideString;
  begin
    if FSectionName='' then Result := Owner.Name else Result := FSectionName;
  end;

  procedure TDKLanguageController.LangData_Load(Stream: TStream);
  begin
    FRootCompEntry.LoadFromDFMResource(Stream);
  end;

  procedure TDKLanguageController.LangData_Store(Stream: TStream);
  begin
    UpdateComponents(True);
    FRootCompEntry.SaveToDFMResource(Stream);
  end;

  procedure TDKLanguageController.Loaded;
  begin
    inherited Loaded;
     // Bind the components and refresh the properties
    if Owner<>nil then begin
      FRootCompEntry.BindComponents(Owner);
      UpdateComponents(False);
       // If at runtime, apply the language currently selected in the LangManager, to the controller itself
      if not (csDesigning in ComponentState) then LangManager.TranslateController(Self);
    end;
  end;

  function TDKLanguageController.LSO_CanStore: Boolean;
  begin
    Result := (Owner<>nil) and (Owner.Name<>'');
     // Update the entries
    if Result then UpdateComponents(True);
  end;

  procedure TDKLanguageController.LSO_StoreLangSource(Strings: TWideStrings; StateFilter: TDKLang_TranslationStates);
  begin
    FRootCompEntry.StoreLangSource(Strings); // StateFilter is not applicable
  end;

  procedure TDKLanguageController.Notification(AComponent: TComponent; Operation: TOperation);
  begin
    inherited Notification(AComponent, Operation);
     // Instantly remove any component that might be contained within entries
    if (Operation=opRemove) and (AComponent<>Self) then FRootCompEntry.RemoveComponent(AComponent, True);
  end;

  procedure TDKLanguageController.SetIgnoreList(Value: TStrings);
  begin
    FIgnoreList.Assign(Value);
  end;

  procedure TDKLanguageController.SetStoreList(Value: TStrings);
  begin
    FStoreList.Assign(Value);
  end;

  procedure TDKLanguageController.UpdateComponents(bModifyList: Boolean);
  var IgnoreMasks, StoreMasks: TDKLang_MaskList;
  begin
     // Create mask lists for testing property names
    IgnoreMasks := TDKLang_MaskList.Create(FIgnoreList);
    try
      StoreMasks := TDKLang_MaskList.Create(FStoreList);
      try
        FRootCompEntry.UpdateEntries(bModifyList, dklcoIgnoreEmptyProps in FOptions, dklcoIgnoreNonAlphaProps in FOptions, dklcoIgnoreFontProps in FOptions, IgnoreMasks, StoreMasks);
      finally
        StoreMasks.Free;
      end;
    finally
      IgnoreMasks.Free;
    end;
  end;

   //===================================================================================================================
   // TDKLang_LangResources
   //===================================================================================================================

  function TDKLang_LangResources.Add(Kind: TDKLang_LangResourceKind; Instance: HINST; const wsName: WideString; iResID: Integer; wLangID: LANGID): Integer;
  var p: PDKLang_LangResource;
  begin
     // First try to find the same language already registered
    Result := IndexOfLangID(wLangID);
     // If not found, create new
    if Result<0 then begin
      New(p);
      Result := inherited Add(p);
      p.wLangID := wLangID;
     // Else get the existing record
    end else
      p := GetItems(Result);
     // Update the resource properties
    p.Kind     := Kind;
    p.Instance := Instance;
    p.wsName   := wsName;
    p.iResID   := iResID;
  end;

  function TDKLang_LangResources.FindLangID(wLangID: LANGID): PDKLang_LangResource;
  var idx: Integer;
  begin
    idx := IndexOfLangID(wLangID);
    if idx<0 then Result := nil else Result := GetItems(idx);
  end;

  function TDKLang_LangResources.GetItems(Index: Integer): PDKLang_LangResource;
  begin
    Result := Get(Index);
  end;

  function TDKLang_LangResources.IndexOfLangID(wLangID: LANGID): Integer;
  begin
    for Result := 0 to Count-1 do
      if GetItems(Result).wLangID=wLangID then Exit;
    Result := -1;
  end;

  procedure TDKLang_LangResources.Notify(Ptr: Pointer; Action: TListNotification);
  begin
     // Don't call inherited Notify() here as it does nothing
    if Action=lnDeleted then Dispose(PDKLang_LangResource(Ptr));
  end;

   //===================================================================================================================
   // TDKLanguageManager
   //===================================================================================================================

  procedure TDKLanguageManager.AddLangController(Controller: TDKLanguageController);
  begin
    FSynchronizer.BeginWrite;
    try
      FLangControllers.Add(Controller);
    finally
      FSynchronizer.EndWrite;
    end;
  end;

  procedure TDKLanguageManager.ApplyTran(Translations: TDKLang_CompTranslations);
  var
    i: Integer;
    Consts: TDKLang_Constants;
  begin
    FSynchronizer.BeginRead;
    try
       // First apply the language to constants as they may be used in controllers' OnLanguageChanged event handlers
      if Translations=nil then Consts := nil else Consts := Translations.Constants;
      FConstants.TranslateFrom(Consts);
       // Apply translation to the controllers
      for i := 0 to FLangControllers.Count-1 do ApplyTranToController(Translations, FLangControllers[i]);
    finally
      FSynchronizer.EndRead;
    end;
  end;

  procedure TDKLanguageManager.ApplyTranToController(Translations: TDKLang_CompTranslations; Controller: TDKLanguageController);
  var
    CE: TDKLang_CompEntry;
    CT: TDKLang_CompTranslation;
  begin
    Controller.DoLanguageChanging;
    try
       // Get the controller's root component entry
      CE := Controller.RootCompEntry;
       // If Translations supplied, try to find the translation for the entry
      if Translations=nil then CT := nil else CT := Translations.FindComponentName(Controller.ActualSectionName);
       // Finally apply the translation, either found or default
      CE.ApplyTranslation(CT, CodePage);
    finally
      Controller.DoLanguageChanged;
    end;
  end;

  constructor TDKLanguageManager.Create;
  begin
    inherited Create;
    FSynchronizer      := TMultiReadExclusiveWriteSynchronizer.Create;
    FConstants         := TDKLang_Constants.Create(GetLanguageID);
    FLangControllers   := TList.Create;
    FLangResources     := TDKLang_LangResources.Create;
    FDefaultLanguageID := ILangID_USEnglish;
    FLanguageID        := FDefaultLanguageID;
    UpdateCodePage;
     // Load the constants from the executable's resources
    FConstants.LoadFromResource(HInstance, SDKLang_ConstResourceName);
     // Load the default translations
    ApplyTran(nil);
  end;

  destructor TDKLanguageManager.Destroy;
  begin
    FConstants.Free;
    FLangControllers.Free;
    FLangResources.Free;
    FSynchronizer.Free;
    inherited Destroy;
  end;

  function TDKLanguageManager.GetConstantValue(const sName: String): WideString;
  begin
    FSynchronizer.BeginRead;
    try
      Result := FConstants.Values[sName];
    finally
      FSynchronizer.EndRead;
    end;
  end;

  function TDKLanguageManager.GetConstantValueA(const sName: String): String;
  begin
    Result := WideStringToStringEx(GetConstantValue(sName), CodePage);
  end;

  function TDKLanguageManager.GetDefaultLanguageID: LANGID;
  begin
    FSynchronizer.BeginRead;
    Result := FDefaultLanguageID;
    FSynchronizer.EndRead;
  end;

  function TDKLanguageManager.GetLanguageCount: Integer;
  begin
    FSynchronizer.BeginRead;
    try
      Result := FLangResources.Count+1; // Increment by 1 for the default language
    finally
      FSynchronizer.EndRead;
    end;
  end;

  function TDKLanguageManager.GetLanguageID: LANGID;
  begin
    FSynchronizer.BeginRead;
    Result := FLanguageID;
    FSynchronizer.EndRead;
  end;

  function TDKLanguageManager.GetLanguageIDs(Index: Integer): LANGID;
  begin
    FSynchronizer.BeginRead;
    try
       // Index=0 always means the default language
      if Index=0 then
        Result := FDefaultLanguageID
      else
        Result := FLangResources[Index-1].wLangID;
    finally
      FSynchronizer.EndRead;
    end;
  end;

  function TDKLanguageManager.GetLanguageIndex: Integer;
  begin
    FSynchronizer.BeginRead;
    try
      Result := IndexOfLanguageID(FLanguageID);
    finally
      FSynchronizer.EndRead;
    end;
  end;

  function TDKLanguageManager.GetLanguageNames(Index: Integer): WideString;
  var wLangID: LANGID;
  begin
    FSynchronizer.BeginRead;
    try
      wLangID := GetLanguageIDs(Index);
    finally
      FSynchronizer.EndRead;
    end;
    Result := WideGetLocaleStr(wLangID, LOCALE_SLANGUAGE, IntToStr(wLangID));
  end;

  function TDKLanguageManager.GetLanguageResources(Index: Integer): PDKLang_LangResource;
  begin
    FSynchronizer.BeginRead;
    try
       // Index=0 always means the default language
      if Index=0 then Result := nil else Result := FLangResources[Index-1];
    finally
      FSynchronizer.EndRead;
    end;
  end;

  function TDKLanguageManager.GetTranslationsForLang(wLangID: LANGID): TDKLang_CompTranslations;
  var plr: PDKLang_LangResource;
  begin
    Result := nil;
    if wLangID<>DefaultLanguageID then begin
       // Try to locate the appropriate resource entry
      plr := FLangResources.FindLangID(wLangID);
      if plr<>nil then begin
        Result := TDKLang_CompTranslations.Create;
        try
          case plr.Kind of
            dklrkResName: Result.Text_LoadFromResource(plr.Instance, plr.wsName);
            dklrkResID:   Result.Text_LoadFromResource(plr.Instance, plr.iResID);
            dklrkFile:    Result.Text_LoadFromFile(plr.wsName);
          end;
        except
          Result.Free;
          raise;
        end;
      end;
    end;
  end;

  function TDKLanguageManager.IndexOfLanguageID(wLangID: LANGID): Integer;
  begin
    FSynchronizer.BeginRead;
    try
      if wLangID=FDefaultLanguageID then Result := 0 else Result := FLangResources.IndexOfLangID(wLangID)+1;
    finally
      FSynchronizer.EndRead;
    end;
  end;

  function TDKLanguageManager.RegisterLangFile(const wsFileName: WideString): Boolean;
  var
    Tran: TDKLang_CompTranslations;
    wLangID: LANGID;
  begin
    Result := False;
    FSynchronizer.BeginWrite;
    try
       // Create and load the component translations object
      if WideFileExists(wsFileName) then begin
        Tran := TDKLang_CompTranslations.Create;
        try
          Tran.Text_LoadFromFile(wsFileName, True);
           // Try to obtain LangID parameter
          wLangID := StrToIntDef(Tran.Params.Values[SDKLang_TranParam_LangID], 0);
           // If succeeded, add the file as a resource
          if wLangID>0 then begin
             // But only if it isn't default language
            if wLangID<>FDefaultLanguageID then FLangResources.Add(dklrkFile, 0, wsFileName, 0, wLangID);
            Result := True;
          end;
        finally
          Tran.Free;
        end;
      end;
    finally
      FSynchronizer.EndWrite;
    end;
  end;

  procedure TDKLanguageManager.RegisterLangResource(Instance: HINST; const wsResourceName: WideString; wLangID: LANGID);
  begin
    FSynchronizer.BeginWrite;
    try
      if wLangID<>FDefaultLanguageID then FLangResources.Add(dklrkResName, Instance, wsResourceName, 0, wLangID);
    finally
      FSynchronizer.EndWrite;
    end;
  end;

  procedure TDKLanguageManager.RegisterLangResource(Instance: HINST; iResID: Integer; wLangID: LANGID);
  begin
    FSynchronizer.BeginWrite;
    try
      if wLangID<>FDefaultLanguageID then FLangResources.Add(dklrkResID, Instance, '', iResID, wLangID);
    finally
      FSynchronizer.EndWrite;
    end;
  end;

  procedure TDKLanguageManager.RemoveLangController(Controller: TDKLanguageController);
  begin
    FSynchronizer.BeginWrite;
    try
      FLangControllers.Remove(Controller);
    finally
      FSynchronizer.EndWrite;
    end;
  end;

  function TDKLanguageManager.ScanForLangFiles(const wsDir, wsMask: WideString; bRecursive: Boolean): Integer;
  var
    wsPath: WideString;
    SRec: TSearchRecW;
  begin
    Result := 0;
     // Determine the path
    wsPath := WideIncludeTrailingPathDelimiter(wsDir);
     // Scan the directory
    if WideFindFirst(wsPath+wsMask, faAnyFile, SRec)=0 then
      try
        repeat
           // Plain file. Try to register it
          if SRec.Attr and faDirectory=0 then begin
            if RegisterLangFile(wsPath+SRec.Name) then Inc(Result);
           // Directory. Recurse if needed
          end else if bRecursive and (SRec.Name[1]<>'.') then
            Inc(Result, ScanForLangFiles(wsPath+SRec.Name, wsMask, True));
        until WideFindNext(SRec)<>0;
      finally
        WideFindClose(SRec);
      end;
  end;

  procedure TDKLanguageManager.SetDefaultLanguageID(Value: LANGID);
  begin
    FSynchronizer.BeginWrite;
    if FDefaultLanguageID<>Value then FDefaultLanguageID := Value;
    FSynchronizer.EndWrite;
  end;

  procedure TDKLanguageManager.SetLanguageID(Value: LANGID);
  var
    bChanged: Boolean;
    Tran: TDKLang_CompTranslations;
  begin
    Tran := nil;
    try
      FSynchronizer.BeginWrite;
      try
         // Try to obtain the Translations object
        Tran := GetTranslationsForLang(Value);
         // If nil returned, assume this a default language
        if Tran=nil then Value := FDefaultLanguageID;
         // If something changed, update the property
        bChanged := FLanguageID<>Value;
        if bChanged then begin
          FLanguageID := Value;
          UpdateCodePage;
        end;
      finally
        FSynchronizer.EndWrite;
      end;
       // Apply the language change after synchronizing ends because applying might require constants etc.
      if bChanged then ApplyTran(Tran);
    finally
      Tran.Free;
    end;
  end;

  procedure TDKLanguageManager.SetLanguageIndex(Value: Integer);
  begin
    SetLanguageID(GetLanguageIDs(Value));
  end;

  procedure TDKLanguageManager.TranslateController(Controller: TDKLanguageController);
  var Tran: TDKLang_CompTranslations;
  begin
    FSynchronizer.BeginRead;
    try
       // If current language is not default, the translation is required
      if FLanguageID<>FDefaultLanguageID then begin
        Tran := GetTranslationsForLang(FLanguageID);
        try
          if Tran<>nil then ApplyTranToController(Tran, Controller);
        finally
          Tran.Free;
        end;
      end;
    finally
      FSynchronizer.EndRead;
    end;
  end;

  procedure TDKLanguageManager.UnregisterLangResource(wLangID: LANGID);
  var idx: Integer;
  begin
    FSynchronizer.BeginWrite;
    try
      if wLangID<>FDefaultLanguageID then begin
        idx := FLangResources.IndexOfLangID(wLangID);
        if idx>=0 then FLangResources.Delete(idx);
      end;
    finally
      FSynchronizer.EndWrite;
    end;
  end;

  procedure TDKLanguageManager.UpdateCodePage;
  begin
    FCodePage := LCIDToCodePage(FLanguageID);
  end;

initialization
finalization
  _LangManager.Free;
end.
