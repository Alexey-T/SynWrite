# coding: cp1251

# Author: Andrey Kvichansky	<kvichans@mail.ru>
# Revision:	0.8
# Last modification: 31 jul 2014

import	configparser

# Logging
#import 	inspect	# stack
#log_gap	= ''	# use only into log()

def convert(sOldFile='', sNewFile=''):
	""" Перенос данных из старого формата сессии в новый.
	Параметры:
		имя старого файла
		имя нового файла.
	Зависимости:
		import	configparser
	Старый формат:
		[Ini]
		Files=полное число вкладок в 2х видах
		PageCount=число вкладок в левом виде
		PageActive= 0 или 1 - активность второго вида
		Page=номер акт вкладки в левом виде (от 0)
		Page2=номер акт вкладки в правом виде (от 0)
		SplitHorz= 0 или 1 - сплиттер видов горизонтален
		SplitPos=сплиттер видов, позиция как %
			Потом идут секции, где внутри имена # - номер от 0
		[FN]
		#=имя файла в utf8 или пусто
		[Top]
		#= номер верхней видимой строки (0 based) в editor master (верхний редактор при сплите вкладки)
		[Top2]
		#= номер верхней видимой строки в slave
		[Cur]
		#= позиция как смещение, каретки в master
		[Cur2]
		#= позиция как смещение, каретки в slave
		[RO]
		#= 0 или 1 для readonly
		[Wrap]
		#= 0 или 1 для wrap mode в master
		[Wrap2]
		#= 0 или 1 для wrap mode в slave
		[Line]
		#= 0 или 1 для line nums visible
		[Fold]
		#= 0 или 1 для folding en
		[SelMode]
		#= int для selection mode (от 0), master
		[SelMode2]
		#= int для selection mode (от 0), slave
		[Color]
		#=цвет таба int
		[ColMarkers]
		#=строка, маркеры колонок, пример "10 20 5" (не парсите)
		[Collapsed]
		#=строка, collapsed ranges, master (не парсите)
		[Collapsed2]
		#=строка, collapsed ranges, slave
	Новый формат:
		[sess]
		gr_mode=4				Номер режима групп (1...)
									1 - one group
									2 - two horz
									3 - two vert
		gr_act=4				Номер активной группы (1..6)
		tab_act=0,0,1,2,0,0		Номера активных вкладок на каж группе (от 0, -1 значит нет вкладок)
		split=50				Позиция сплиттера (int в процентах), только для режимов 1*2, 2*1 и 1+2, иначе 50
		tabs=					Число вкладок, оно только для оценки "много ли"
			Потом идут секции [f#] где # - номер вкладки от 0
		[f0]
		gr=						Номер группы (1..6)
		fn=						Имя файла utf8 (точку ".\" не парсить)
		top=10,20				Два числа - top line для master, slave
		caret=10,20				Два числа - каретка для master, slave
		wrap=0,0				Два bool (0/1) - wrap mode для master, slave
		prop=0,0,0,0,			4 числа через зап.
			- r/o (bool)
			- line nums visible (bool)
			- folding enabled (bool) - (NB! Было раньше disabled)
			- select mode (0..)
		color=					Цвет таба (строка та же)
		colmark=				Col markers (строка та же)
		folded=					2 строки через ";" - collapsed ranges для master, slave
	"""
	#pass;						log('sOldFile, sNewFile={}',(sOldFile, sNewFile))
	# Подготовка
	cfgOld = configparser.ConfigParser()
	cfgOld.read(sOldFile, encoding='utf-8')
	cfgNew = configparser.ConfigParser()

	# Преобразование
	scOIni	= cfgOld['Ini']
	nFs		= int(scOIni['Files'])
	cfgNew['sess']	= {
		'gr_mode'	:icase(False,''
						,'0'==scOIni['PageCount'], '1'			# Нет доп.панели
						,'0'==scOIni['SplitHorz'], '2'			# Доп.панель справа
						,'1'==scOIni['SplitHorz'], '3'			# Доп.панель снизу
						)
	,	'gr_act'	:icase('0'==scOIni['PageActive'], '1', '2')	# Фокус в доп.панели
	,	'tab_act'	:scOIni['Page']		+','+	scOIni['Page2']
	,	'split'		:scOIni['SplitPos']
	,	'tabs'		:nFs
	}
	for n,sN in ((n,'{}'.format(n)) for n in range(nFs)):
		cfgNew['f'+sN]	= {}
		scNFn			= cfgNew['f'+sN]
		scNFn['fn']		= cfgOld['FN'][sN]
		scNFn['gr']		= icase(n<=int(scOIni['PageCount']), '1', '2')

		sColor			= cfgOld['Color'][sN] 		if cfgOld.has_section('Color') 		else ''
		sColMarkers		= cfgOld['ColMarkers'][sN]	if cfgOld.has_section('ColMarkers')	else ''
		sTop			= cfgOld['Top'][sN] 		if cfgOld.has_section('Top') 		else '0'
		sTop2			= cfgOld['Top2'][sN] 		if cfgOld.has_section('Top2') 		else '0'
		sCur			= cfgOld['Cur'][sN] 		if cfgOld.has_section('Cur') 		else '0'
		sCur2			= cfgOld['Cur2'][sN] 		if cfgOld.has_section('Cur2') 		else '0'
		sWrap			= cfgOld['Wrap'][sN] 		if cfgOld.has_section('Wrap') 		else '0'
		sWrap2			= cfgOld['Wrap2'][sN] 		if cfgOld.has_section('Wrap2') 		else '0'
		sCollapsed		= cfgOld['sCollapsed'][sN] 	if cfgOld.has_section('sCollapsed')  else ''
		sCollapsed2		= cfgOld['sCollapsed2'][sN] if cfgOld.has_section('sCollapsed2') else ''
		sRO				= cfgOld['RO'][sN] 			if cfgOld.has_section('RO') 		else '0'
		sLine			= cfgOld['Line'][sN] 		if cfgOld.has_section('Line') 		else '0'
		sFold			= cfgOld['Fold'][sN] 		if cfgOld.has_section('Fold') 		else '0'
		sSelMode		= cfgOld['SelMode'][sN] 	if cfgOld.has_section('SelMode')	else '0'
		
		scNFn['color']	= sColor
		scNFn['colmark']= sColMarkers
		scNFn['top']	= sTop		+','+sTop2
		scNFn['caret']	= sCur		+','+sCur2
		scNFn['wrap']	= sWrap		+','+sWrap2
		scNFn['folded']	= sCollapsed+';'+sCollapsed2
		scNFn['prop']	= '{},{},{},{}'.format(sRO, sLine, {'0':'1','1':'0'}[sFold], sSelMode)

	# Сохранение
	with open(sNewFile,'w',encoding='utf-8') as out:
		cfgNew.write(out, space_around_delimiters=False)
	#def sessOld2New

#######################################################
#def log(msg='', *args):
#	""" en:
#		Light print-logger. Commands are included into msg:  
#			>> << {{	Expand/Narrow/Cancel gap 
#		Execute msg.format(*args).  So you can insert Format String Syntax into msg.
#		Replace '¬' to chr(9), '¶'to chr(10).
#		ru:
#		Легкий pring-логгер. Управляющие команды внутри msg:
#			>> << {{	Увеличить/Уменьшить/Отменить отступ 
#		Выполняет msg.format(*args). Поэтому в msg можно использовать Format String Syntax.
#		Заменяет '¬' на chr(9), '¶'на chr(10).
#
#		Example.
#		1	class C:
#		2		def m(): 
#		3			log('qwerty') 
#		4			log('>>more gap here') 
#		5			log('v1={}¶v2,v3¬{}',12,('ab',{})) 
#		6			log('<<less gap at next') 
#		7			log('QWERTY') 
#		output 
#			C.m:3 qwerty
#				C.m:4 >>more gap here
#				C.m:5 v1=12
#			v2,v3	('ab', {}) 
#				C.m:6 <<less gap at next
#			C.m:7 QWERTY
#	"""
#	global log_gap
#	lctn	= ''
#	if -1==-1: # add "location"
#		frCaller= inspect.stack()[1]	# 0-log, 1-need func
#		try:
#			cls	= frCaller[0].f_locals['self'].__class__.__name__ + '.'
#		except:
#			cls	= ''
#		fun,ln	= (cls + frCaller[3]).replace('.__init__','()'), frCaller[2]
#		lctn	= '{}:{} '.format(fun, ln)
#
#	if 0<len(args):
#		msg	= msg.format(*args) 
#	log_gap = log_gap + (chr(9) if '>>' in msg else '')
#	msg		= log_gap + lctn + msg.replace('¬',chr(9)).replace('¶',chr(10))
#		
#	print(msg)
#	
#	log_gap = icase('<<' in msg, log_gap[:-1]
#				,	'{{' in msg, ''
#				,				 log_gap )
	#def log

def icase(*pars):
	""" en:
		Params	cond1,val1[, cond2,val2, ...[, valElse]...]
		Result	Value for first true cond in pairs otherwise last odd param or None
		ru:
		Параметры	усл-1,знач-1[, усл-2,знач-2, ...[, знач-Иначе]...]
		Результат	Первое значение, для которого есть парное истинное условие.
					Иначе последний нечетный параметр, а если его нет, то None
		Examles
			icase(1==2,'a', 3==3,'b') == 'b'
			icase(1==2,'a', 3==4,'b', 'c') == 'c'
			icase(1==2,'a', 3==4,'b') == None
	"""
	for ppos in range(1,len(pars),2) :
		if pars[ppos-1] :
			return pars[ppos]
	return pars[-1] if 1==len(pars)%2 else None
	#def icase

