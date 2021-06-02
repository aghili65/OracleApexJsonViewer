prompt --application/set_environment
set define off verify off feedback off
whenever sqlerror exit sql.sqlcode rollback
--------------------------------------------------------------------------------
--
-- ORACLE Application Express (APEX) export file
--
-- You should run the script connected to SQL*Plus as the Oracle user
-- APEX_200200 or as the owner (parsing schema) of the application.
--
-- NOTE: Calls to apex_application_install override the defaults below.
--
--------------------------------------------------------------------------------
begin
wwv_flow_api.import_begin (
 p_version_yyyy_mm_dd=>'2020.10.01'
,p_release=>'20.2.0.00.20'
,p_default_workspace_id=>2000807215575822
,p_default_application_id=>100
,p_default_id_offset=>0
,p_default_owner=>'SINA_ADMIN'
);
end;
/
 
prompt APPLICATION 100 - test_app1
--
-- Application Export:
--   Application:     100
--   Name:            test_app1
--   Date and Time:   16:06 Wednesday June 2, 2021
--   Exported By:     ADMIN
--   Flashback:       0
--   Export Type:     Component Export
--   Manifest
--     PLUGIN: 4700898682692603
--   Manifest End
--   Version:         20.2.0.00.20
--   Instance ID:     300166756200870
--

begin
  -- replace components
  wwv_flow_api.g_mode := 'REPLACE';
end;
/
prompt --application/shared_components/plugins/item_type/json_viewr
begin
wwv_flow_api.create_plugin(
 p_id=>wwv_flow_api.id(4700898682692603)
,p_plugin_type=>'ITEM TYPE'
,p_name=>'JSON_VIEWR'
,p_display_name=>'json_viewr'
,p_supported_ui_types=>'DESKTOP'
,p_supported_component_types=>'APEX_APPLICATION_PAGE_ITEMS:APEX_APPL_PAGE_IG_COLUMNS'
,p_plsql_code=>wwv_flow_string.join(wwv_flow_t_varchar2(
'procedure render_json_viewr(',
'    p_item   in            apex_plugin.t_item,',
'    p_plugin in            apex_plugin.t_plugin,',
'    p_param  in            apex_plugin.t_item_render_param,',
'    p_result in out nocopy apex_plugin.t_item_render_result ) ',
'is',
'  l_escaped_value varchar2(32767) := sys.htf.escape_sc(''123'');',
'  l_name          varchar2(30)    := apex_plugin.get_input_name_for_page_item(false);',
'  v_html clob;',
'',
'begin',
'           ',
'',
'',
'-- load css and javascript',
'apex_javascript.add_library (p_name => ''js/json-viewer'', p_directory => p_plugin.file_prefix); ',
'apex_css.add_file  (p_name => ''css/json-viewer'', p_directory => p_plugin.file_prefix); ',
'',
'htp.p(''<div '' || ''id="'' || p_item.name ||''" '' ',
'              || ''name="'' || l_name ||''" '' ',
'              ||  p_item.element_attributes ||'' ></div>'');',
'',
'v_html:=''$("#'' || p_item.name || ''").jsonview('''''' || p_param.value || '''''')'';',
'',
'apex_javascript.add_onload_code(',
'         p_code => v_html,',
'         p_key => NULL);    ',
'end;'))
,p_api_version=>2
,p_render_function=>'render_json_viewr'
,p_standard_attributes=>'VISIBLE:FORM_ELEMENT:SESSION_STATE:QUICKPICK:SOURCE:FORMAT_MASK_DATE:FORMAT_MASK_NUMBER:ELEMENT:WIDTH:HEIGHT:ELEMENT_OPTION:PLACEHOLDER:ICON:ENCRYPT:FILTER:LINK:INIT_JAVASCRIPT_CODE'
,p_substitute_attributes=>true
,p_subscribe_plugin_settings=>true
,p_version_identifier=>'1.0'
,p_about_url=>'https://github.com/aghili65/OracleApexJsonViewer'
,p_plugin_comment=>wwv_flow_string.join(wwv_flow_t_varchar2(
'created by abolfazl aghili ',
'',
'email: aghili65@gmail.com'))
,p_files_version=>4
);
wwv_flow_api.create_plugin_std_attribute(
 p_id=>wwv_flow_api.id(4703504282790160)
,p_plugin_id=>wwv_flow_api.id(4700898682692603)
,p_name=>'INIT_JAVASCRIPT_CODE'
,p_is_required=>false
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '2166756E6374696F6E2824297B0A0A202020202775736520737472696374273B0A0A20202020242E666E2E6A736F6E76696577203D2066756E6374696F6E286A736F6E2C206F7074696F6E7329207B0A202020202020202072657475726E20746869732E';
wwv_flow_api.g_varchar2_table(2) := '65616368282066756E6374696F6E2829207B0A2020202020202020202020207661722073656C66203D20242874686973293B0A20202020202020202020202069662028747970656F66206A736F6E203D3D2027737472696E672729207B0A202020202020';
wwv_flow_api.g_varchar2_table(3) := '202020202020202020202020202073656C662E6461746128276A736F6E272C206A736F6E293B0A2020202020202020202020207D0A202020202020202020202020656C736520696628747970656F66206A736F6E203D3D20276F626A6563742729207B0A';
wwv_flow_api.g_varchar2_table(4) := '202020202020202020202020202020202020202073656C662E6461746128276A736F6E272C204A534F4E2E737472696E67696679286A736F6E29290A2020202020202020202020207D0A202020202020202020202020656C7365207B0A20202020202020';
wwv_flow_api.g_varchar2_table(5) := '2020202020202020202020202073656C662E6461746128276A736F6E272C202727293B0A2020202020202020202020207D0A2020202020202020202020206E6577204A736F6E5669657765722873656C662C206F7074696F6E73293B0A20202020202020';
wwv_flow_api.g_varchar2_table(6) := '207D293B0A202020207D3B0A0A2020202066756E6374696F6E204A736F6E5669657765722873656C662C206F7074696F6E7329207B0A2020202020202020766172206A736F6E203D20242E70617273654A534F4E2873656C662E6461746128276A736F6E';
wwv_flow_api.g_varchar2_table(7) := '2729293B0A20202020202020206F7074696F6E73203D20242E657874656E64287B7D2C20746869732E64656661756C74732C206F7074696F6E73293B0A202020202020202076617220657870616E646572436C6173736573203D20676574457870616E64';
wwv_flow_api.g_varchar2_table(8) := '6572436C6173736573286F7074696F6E732E657870616E646564293B0A202020202020202073656C662E68746D6C28273C756C20636C6173733D226A736F6E2D636F6E7461696E6572223E3C2F756C3E27293B0A202020202020202073656C662E66696E';
wwv_flow_api.g_varchar2_table(9) := '6428272E6A736F6E2D636F6E7461696E657227292E617070656E64286A736F6E3268746D6C285B6A736F6E5D2C20657870616E646572436C617373657329293B0A202020207D0A0A2020202066756E6374696F6E20676574457870616E646572436C6173';
wwv_flow_api.g_varchar2_table(10) := '73657328657870616E64656429207B0A202020202020202069662821657870616E646564292072657475726E2027657870616E64656420636F6C6C61707365642068696464656E273B0A202020202020202072657475726E2027657870616E646564273B';
wwv_flow_api.g_varchar2_table(11) := '0A202020207D0A0A2020202066756E6374696F6E206A736F6E3268746D6C286A736F6E2C20657870616E646572436C617373657329207B0A20202020202020207661722068746D6C203D2027273B0A2020202020202020666F722028766172206B657920';
wwv_flow_api.g_varchar2_table(12) := '696E206A736F6E29207B0A20202020202020202020202069662028216A736F6E2E6861734F776E50726F7065727479286B65792929207B0A20202020202020202020202020202020636F6E74696E75653B0A2020202020202020202020207D0A0A202020';
wwv_flow_api.g_varchar2_table(13) := '2020202020202020207661722076616C7565203D206A736F6E5B6B65795D2C0A2020202020202020202020202020202074797065203D20747970656F66206A736F6E5B6B65795D3B0A0A20202020202020202020202068746D6C203D2068746D6C202B20';
wwv_flow_api.g_varchar2_table(14) := '637265617465456C656D656E74286B65792C2076616C75652C20747970652C20657870616E646572436C6173736573293B0A20202020202020207D0A202020202020202072657475726E2068746D6C3B0A202020207D0A0A2020202066756E6374696F6E';
wwv_flow_api.g_varchar2_table(15) := '20656E636F64652876616C756529207B0A202020202020202072657475726E202428273C6469762F3E27292E746578742876616C7565292E68746D6C28293B0A202020207D0A0A2020202066756E6374696F6E20637265617465456C656D656E74286B65';
wwv_flow_api.g_varchar2_table(16) := '792C2076616C75652C20747970652C20657870616E646572436C617373657329207B0A2020202020202020766172206B6C617373203D20276F626A656374272C0A2020202020202020202020206F70656E203D20277B272C0A2020202020202020202020';
wwv_flow_api.g_varchar2_table(17) := '20636C6F7365203D20277D273B0A0A202020202020202069662028242E697341727261792876616C75652929207B0A2020202020202020202020206B6C617373203D20276172726179273B0A2020202020202020202020206F70656E203D20275B273B0A';
wwv_flow_api.g_varchar2_table(18) := '202020202020202020202020636C6F7365203D20275D273B0A20202020202020207D0A0A20202020202020206966202876616C7565203D3D3D206E756C6C29207B0A20202020202020202020202072657475726E20273C6C693E3C7370616E20636C6173';
wwv_flow_api.g_varchar2_table(19) := '733D226B6579223E2227202B20656E636F6465286B657929202B2027223A203C2F7370616E3E3C7370616E20636C6173733D226E756C6C223E2227202B20656E636F64652876616C756529202B2027223C2F7370616E3E3C2F6C693E273B0A2020202020';
wwv_flow_api.g_varchar2_table(20) := '2020207D0A0A20202020202020207377697463682874797065297B0A2020202020202020202020206361736520276F626A656374273A0A20202020202020202020202020202020766172206F626A656374203D20273C6C693E3C7370616E20636C617373';
wwv_flow_api.g_varchar2_table(21) := '3D22272B20657870616E646572436C6173736573202B27223E3C2F7370616E3E3C7370616E20636C6173733D226B6579223E2227202B20656E636F6465286B657929202B2027223A203C2F7370616E3E203C7370616E20636C6173733D226F70656E223E';
wwv_flow_api.g_varchar2_table(22) := '27202B206F70656E202B20273C2F7370616E3E203C756C20636C6173733D2227202B206B6C617373202B2027223E273B0A202020202020202020202020202020206F626A656374203D206F626A656374202B206A736F6E3268746D6C2876616C75652C20';
wwv_flow_api.g_varchar2_table(23) := '657870616E646572436C6173736573293B0A2020202020202020202020202020202072657475726E206F626A656374202B20273C2F756C3E3C7370616E20636C6173733D22636C6F7365223E27202B20636C6F7365202B20273C2F7370616E3E3C2F6C69';
wwv_flow_api.g_varchar2_table(24) := '3E273B0A20202020202020202020202020202020627265616B3B0A2020202020202020202020206361736520276E756D626572273A0A202020202020202020202020636173652027626F6F6C65616E273A0A202020202020202020202020202020207265';
wwv_flow_api.g_varchar2_table(25) := '7475726E20273C6C693E3C7370616E20636C6173733D226B6579223E2227202B20656E636F6465286B657929202B2027223A203C2F7370616E3E3C7370616E20636C6173733D22272B2074797065202B2027223E27202B20656E636F64652876616C7565';
wwv_flow_api.g_varchar2_table(26) := '29202B20273C2F7370616E3E3C2F6C693E273B0A20202020202020202020202064656661756C743A0A2020202020202020202020202020202072657475726E20273C6C693E3C7370616E20636C6173733D226B6579223E2227202B20656E636F6465286B';
wwv_flow_api.g_varchar2_table(27) := '657929202B2027223A203C2F7370616E3E3C7370616E20636C6173733D22272B2074797065202B2027223E2227202B20656E636F64652876616C756529202B2027223C2F7370616E3E3C2F6C693E273B0A20202020202020202020202020202020627265';
wwv_flow_api.g_varchar2_table(28) := '616B3B0A20202020202020207D0A202020207D0A0A202020202428646F63756D656E74292E6F6E2827636C69636B272C20272E6A736F6E2D636F6E7461696E6572202E657870616E646564272C2066756E6374696F6E286576656E7429207B0A20202020';
wwv_flow_api.g_varchar2_table(29) := '202020206576656E742E70726576656E7444656661756C7428293B0A20202020202020206576656E742E73746F7050726F7061676174696F6E28293B0A2020202020202020766172202473656C66203D20242874686973293B0A20202020202020202473';
wwv_flow_api.g_varchar2_table(30) := '656C662E706172656E7428292E66696E6428273E756C27292E736C6964655570283130302C2066756E6374696F6E2829207B0A2020202020202020202020202473656C662E616464436C6173732827636F6C6C617073656427293B0A2020202020202020';
wwv_flow_api.g_varchar2_table(31) := '7D293B0A202020207D293B0A0A202020202428646F63756D656E74292E6F6E2827636C69636B272C20272E6A736F6E2D636F6E7461696E6572202E657870616E6465642E636F6C6C6170736564272C2066756E6374696F6E286576656E7429207B0A2020';
wwv_flow_api.g_varchar2_table(32) := '2020202020206576656E742E70726576656E7444656661756C7428293B0A20202020202020206576656E742E73746F7050726F7061676174696F6E28293B0A2020202020202020766172202473656C66203D20242874686973293B0A2020202020202020';
wwv_flow_api.g_varchar2_table(33) := '2473656C662E72656D6F7665436C6173732827636F6C6C617073656427292E706172656E7428292E66696E6428273E756C27292E736C696465446F776E283130302C2066756E6374696F6E2829207B0A2020202020202020202020202473656C662E7265';
wwv_flow_api.g_varchar2_table(34) := '6D6F7665436C6173732827636F6C6C617073656427292E72656D6F7665436C617373282768696464656E27293B0A20202020202020207D293B0A202020207D293B0A0A202020204A736F6E5669657765722E70726F746F747970652E64656661756C7473';
wwv_flow_api.g_varchar2_table(35) := '203D207B0A2020202020202020657870616E6465643A20747275650A202020207D3B0A0A7D2877696E646F772E6A5175657279293B';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(4701518817695534)
,p_plugin_id=>wwv_flow_api.id(4700898682692603)
,p_file_name=>'js/json-viewer.js'
,p_mime_type=>'application/javascript'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
begin
wwv_flow_api.g_varchar2_table := wwv_flow_api.empty_varchar2_table;
wwv_flow_api.g_varchar2_table(1) := '0A2E6A736F6E2D636F6E7461696E6572207B0A20202020666F6E742D73697A653A20313370783B0A09666F6E742D66616D696C793A226972616E79656B616E222C2073616E732D73657269663B0A202020206C696E652D6865696768743A20312E323B0A';
wwv_flow_api.g_varchar2_table(2) := '20202020666F6E742D66616D696C793A206D6F6E6F73706163653B0A2020202070616464696E672D6C6566743A20303B0A202020206D617267696E2D6C6566743A20323070783B0A7D0A2E6A736F6E2D636F6E7461696E65722C0A2E6A736F6E2D636F6E';
wwv_flow_api.g_varchar2_table(3) := '7461696E657220756C7B0A202020206C6973742D7374796C653A206E6F6E652021696D706F7274616E743B0A7D0A2E6A736F6E2D636F6E7461696E657220756C7B0A2020202070616464696E673A203070782021696D706F7274616E743B0A2020202070';
wwv_flow_api.g_varchar2_table(4) := '616464696E672D6C6566743A20323070782021696D706F7274616E743B0A202020206D617267696E3A203070782021696D706F7274616E743B0A7D0A0A2E6A736F6E2D636F6E7461696E6572206C69207B0A20202020706F736974696F6E3A2072656C61';
wwv_flow_api.g_varchar2_table(5) := '746976653B0A7D0A0A2E6A736F6E2D636F6E7461696E6572203E206C6920203E202E6B65792C0A2E6A736F6E2D636F6E7461696E6572202E6172726179202E6B65797B0A20202020646973706C61793A206E6F6E653B0A7D0A0A2E6A736F6E2D636F6E74';
wwv_flow_api.g_varchar2_table(6) := '61696E6572202E6172726179202E6F626A656374202E6B65797B0A20202020646973706C61793A20696E6C696E653B0A7D0A0A2E6A736F6E2D636F6E7461696E6572206C693A6166746572207B0A20202020636F6E74656E743A20222C223B0A7D0A0A2E';
wwv_flow_api.g_varchar2_table(7) := '6A736F6E2D636F6E7461696E6572206C693A6C6173742D6368696C643A6166746572207B0A20202020636F6E74656E743A2022223B0A7D0A0A2E6A736F6E2D636F6E7461696E6572202E6E756C6C7B0A20202020636F6C6F723A20233939393B0A7D0A2E';
wwv_flow_api.g_varchar2_table(8) := '6A736F6E2D636F6E7461696E6572202E737472696E677B0A20202020636F6C6F723A20233465396130363B0A7D0A2E6A736F6E2D636F6E7461696E6572202E6E756D6265727B0A20202020636F6C6F723A20236134303030303B0A7D0A2E6A736F6E2D63';
wwv_flow_api.g_varchar2_table(9) := '6F6E7461696E6572202E626F6F6C65616E7B0A20202020636F6C6F723A20236334613030303B0A7D0A2E6A736F6E2D636F6E7461696E6572202E6B65797B0A20202020636F6C6F723A20233230346138373B0A7D0A2E6A736F6E2D636F6E7461696E6572';
wwv_flow_api.g_varchar2_table(10) := '202E657870616E6465647B0A20202020637572736F723A20706F696E7465723B0A7D0A0A2E6A736F6E2D636F6E7461696E6572202E657870616E6465643A6265666F72657B0A20202020636F6E74656E743A20222D223B0A20202020666F6E742D73697A';
wwv_flow_api.g_varchar2_table(11) := '653A20323570783B0A2020202077696474683A20313370783B0A20202020746578742D616C69676E3A2063656E7465723B0A202020206C696E652D6865696768743A20313370783B0A20202020666F6E742D66616D696C793A2073616E732D7365726966';
wwv_flow_api.g_varchar2_table(12) := '3B0A20202020636F6C6F723A20233933333B0A20202020706F736974696F6E3A206162736F6C7574653B0A202020206C6566743A202D313570783B0A20202020746F703A203370783B0A7D0A0A2E6A736F6E2D636F6E7461696E6572202E636F6C6C6170';
wwv_flow_api.g_varchar2_table(13) := '7365643A6265666F72657B0A20202020636F6E74656E743A20222B223B0A20202020666F6E742D73697A653A20323570783B0A20202020636F6C6F723A20233030303B0A20202020746F703A203170783B0A7D0A0A2E6A736F6E2D636F6E7461696E6572';
wwv_flow_api.g_varchar2_table(14) := '206C69202E636F6C6C6170736564207E202E636C6F73653A6265666F7265207B0A20202020636F6E74656E743A20222E2E2E20223B0A20202020636F6C6F723A20233939393B0A7D0A0A2E6A736F6E2D636F6E7461696E6572202E68696464656E207E20';
wwv_flow_api.g_varchar2_table(15) := '756C207B0A2020646973706C61793A206E6F6E653B0A7D';
null;
end;
/
begin
wwv_flow_api.create_plugin_file(
 p_id=>wwv_flow_api.id(4702102782697289)
,p_plugin_id=>wwv_flow_api.id(4700898682692603)
,p_file_name=>'css/json-viewer.css'
,p_mime_type=>'text/css'
,p_file_charset=>'utf-8'
,p_file_content=>wwv_flow_api.varchar2_to_blob(wwv_flow_api.g_varchar2_table)
);
end;
/
prompt --application/end_environment
begin
wwv_flow_api.import_end(p_auto_install_sup_obj => nvl(wwv_flow_application_install.get_auto_install_sup_obj, false));
commit;
end;
/
set verify on feedback on define on
prompt  ...done
