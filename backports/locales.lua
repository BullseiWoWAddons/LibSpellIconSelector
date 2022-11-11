if LOCALE_deDE then
	ICON_SELECTION_CLICK = ICON_SELECTION_CLICK or "Klicken, um in der Liste zu sehen";
	ICON_SELECTION_DRAG = ICON_SELECTION_DRAG or "Symbol hierher ziehen, um es als Euer Anzeigebild zu verwenden";
	ICON_SELECTION_NOTINLIST = ICON_SELECTION_NOTINLIST or "Dieses Symbol ist nicht in der Liste";
	ICON_SELECTION_TITLE_CURRENT = ICON_SELECTION_TITLE_CURRENT or "Aktuell ausgewählt";
	ICON_SELECTION_TITLE_CUSTOM = ICON_SELECTION_TITLE_CUSTOM or "Benutzerdefiniertes Symbol";
elseif LOCALE_esES then
	ICON_SELECTION_CLICK = ICON_SELECTION_CLICK or "Haz clic para verlo en la lista";
	ICON_SELECTION_DRAG = ICON_SELECTION_DRAG or "Arrastra un icono aquí para usarlo como representación";
	ICON_SELECTION_NOTINLIST = ICON_SELECTION_NOTINLIST or "Este icono no está en la lista";
	ICON_SELECTION_TITLE_CURRENT = ICON_SELECTION_TITLE_CURRENT or "Seleccionado actualmente";
	ICON_SELECTION_TITLE_CUSTOM = ICON_SELECTION_TITLE_CUSTOM or "Icono personalizado";
--@localization(locale="esES", format="lua_additive_table", handle-subnamespaces="none", handle-unlocalized="ignore")@
elseif LOCALE_esMX then
	ICON_SELECTION_CLICK = ICON_SELECTION_CLICK or "Haz clic para ver en la lista";
	ICON_SELECTION_DRAG = ICON_SELECTION_DRAG or "Arrastra una imagen aquí para usarla como ícono";
	ICON_SELECTION_NOTINLIST = ICON_SELECTION_NOTINLIST or "Este ícono no está en la lista";
	ICON_SELECTION_TITLE_CURRENT = ICON_SELECTION_TITLE_CURRENT or "Selección actual";
	ICON_SELECTION_TITLE_CUSTOM = ICON_SELECTION_TITLE_CUSTOM or "Ícono personalizado";
--@localization(locale="esMX", format="lua_additive_table", handle-subnamespaces="none", handle-unlocalized="ignore")@
elseif LOCALE_frFR then
	ICON_SELECTION_CLICK = ICON_SELECTION_CLICK or "Cliquer pour afficher dans la liste";
	ICON_SELECTION_DRAG = ICON_SELECTION_DRAG or "Déplacer une icône ici pour l’utiliser à l’écran";
	ICON_SELECTION_NOTINLIST = ICON_SELECTION_NOTINLIST or "Cette icône n’est pas dans la liste";
	ICON_SELECTION_TITLE_CURRENT = ICON_SELECTION_TITLE_CURRENT or "Sélection actuelle";
	ICON_SELECTION_TITLE_CUSTOM = ICON_SELECTION_TITLE_CUSTOM or "Icône personnalisée";
--@localization(locale="frFR", format="lua_additive_table", handle-subnamespaces="none", handle-unlocalized="ignore")@
elseif LOCALE_itIT then
	ICON_SELECTION_CLICK = ICON_SELECTION_CLICK or "Clicca per consultare l'elenco";
	ICON_SELECTION_DRAG = ICON_SELECTION_DRAG or "Trascina un'icona qui per usarla come immagine";
	ICON_SELECTION_NOTINLIST = ICON_SELECTION_NOTINLIST or "Quest'icona non è nella lista";
	ICON_SELECTION_TITLE_CURRENT = ICON_SELECTION_TITLE_CURRENT or "Attualmente selezionata";
	ICON_SELECTION_TITLE_CUSTOM = ICON_SELECTION_TITLE_CUSTOM or "Icona personalizzata";
--@localization(locale="itIT", format="lua_additive_table", handle-subnamespaces="none", handle-unlocalized="ignore")@
elseif LOCALE_koKR then
	ICON_SELECTION_CLICK = ICON_SELECTION_CLICK or "목록을 보려면 클릭";
	ICON_SELECTION_DRAG = ICON_SELECTION_DRAG or "디스플레이로 사용할 아이콘을 이곳으로 끌어다 놓기";
	ICON_SELECTION_NOTINLIST = ICON_SELECTION_NOTINLIST or "목록에 없는 아이콘입니다.";
	ICON_SELECTION_TITLE_CURRENT = ICON_SELECTION_TITLE_CURRENT or "현재 선택됨";
	ICON_SELECTION_TITLE_CUSTOM = ICON_SELECTION_TITLE_CUSTOM or "사용자 설정 아이콘";
--@localization(locale="koKR", format="lua_additive_table", handle-subnamespaces="none", handle-unlocalized="ignore")@
elseif LOCALE_ptBR or LOCALE_ptPT then
	ICON_SELECTION_CLICK = ICON_SELECTION_CLICK or "Clique para vê-la na lista";
	ICON_SELECTION_DRAG = ICON_SELECTION_DRAG or "Arraste um ícone para cá para usá-lo como sua tela";
	ICON_SELECTION_NOTINLIST = ICON_SELECTION_NOTINLIST or "Este ícone não está na lista";
	ICON_SELECTION_TITLE_CURRENT = ICON_SELECTION_TITLE_CURRENT or "Seleção atual";
	ICON_SELECTION_TITLE_CUSTOM = ICON_SELECTION_TITLE_CUSTOM or "Ícone personalizado";
--@localization(locale="ptBR", format="lua_additive_table", handle-subnamespaces="none", handle-unlocalized="ignore")@
elseif LOCALE_ruRU then
	ICON_SELECTION_CLICK = ICON_SELECTION_CLICK or "Щелкните, чтобы просмотреть в виде списка";
	ICON_SELECTION_DRAG = ICON_SELECTION_DRAG or "Перетащите сюда значок, который хотите использовать";
	ICON_SELECTION_NOTINLIST = ICON_SELECTION_NOTINLIST or "Этого значка нет в списке";
	ICON_SELECTION_TITLE_CURRENT = ICON_SELECTION_TITLE_CURRENT or "Текущий выбор";
	ICON_SELECTION_TITLE_CUSTOM = ICON_SELECTION_TITLE_CUSTOM or "Пользовательский значок";
--@localization(locale="ruRU", format="lua_additive_table", handle-subnamespaces="none", handle-unlocalized="ignore")@
elseif LOCALE_zhCN then
	ICON_SELECTION_CLICK = ICON_SELECTION_CLICK or "点击在列表中浏览";
	ICON_SELECTION_DRAG = ICON_SELECTION_DRAG or "将一个图标拖曳至此处来显示";
	ICON_SELECTION_NOTINLIST = ICON_SELECTION_NOTINLIST or "此图标不在列表中";
	ICON_SELECTION_TITLE_CURRENT = ICON_SELECTION_TITLE_CURRENT or "当前已选择";
	ICON_SELECTION_TITLE_CUSTOM = ICON_SELECTION_TITLE_CUSTOM or "自定图标";
--@localization(locale="zhCN", format="lua_additive_table", handle-subnamespaces="none", handle-unlocalized="ignore")@
elseif LOCALE_zhTW then
	ICON_SELECTION_CLICK = ICON_SELECTION_CLICK or "點擊以在列表中查看";
	ICON_SELECTION_DRAG = ICON_SELECTION_DRAG or "拖曳一個圖示至此處以做為你的顯示";
	ICON_SELECTION_NOTINLIST = ICON_SELECTION_NOTINLIST or "此圖示不在列表裡";
	ICON_SELECTION_TITLE_CURRENT = ICON_SELECTION_TITLE_CURRENT or "目前選擇";
	ICON_SELECTION_TITLE_CUSTOM = ICON_SELECTION_TITLE_CUSTOM or "自訂圖示";
--@localization(locale="zhTW", format="lua_additive_table", handle-subnamespaces="none", handle-unlocalized="ignore")@
else
	ICON_SELECTION_CLICK = ICON_SELECTION_CLICK or "Click to view in the list";
	ICON_SELECTION_DRAG = ICON_SELECTION_DRAG or "Drag an icon here to use it as your display";
	ICON_SELECTION_NOTINLIST = ICON_SELECTION_NOTINLIST or "This icon is not in the list";
	ICON_SELECTION_TITLE_CURRENT = ICON_SELECTION_TITLE_CURRENT or "Currently Selected";
	ICON_SELECTION_TITLE_CUSTOM = ICON_SELECTION_TITLE_CUSTOM or "Custom Icon";
end