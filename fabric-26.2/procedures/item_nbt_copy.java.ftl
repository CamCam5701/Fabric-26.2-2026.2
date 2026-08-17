<#include "mcitems.ftl">
<#assign _source_stack = mappedMCItemToItemStackCode(input$a, 1)>
<#assign _target_stack = mappedMCItemToItemStackCode(input$b, 1)>
<#if (field$ignoredefaults!"FALSE") == "TRUE">
${_target_stack}.applyComponents(${_source_stack}.getComponentsPatch());
<#else>
// Minecraft 26.2: ITEM_MODEL is a resolved/default component on every item.
// Copying the source's full component map would also copy its model and make the
// target item render as the source item. Preserve the target item's own model.
var _targetItemModel = ${_target_stack}.get(net.minecraft.core.component.DataComponents.ITEM_MODEL);
${_target_stack}.applyComponents(${_source_stack}.getComponents());
if (_targetItemModel != null)
	${_target_stack}.set(net.minecraft.core.component.DataComponents.ITEM_MODEL, _targetItemModel);
</#if>
