/**
 * @license Copyright (c) 2003-2015, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */

CKEDITOR.editorConfig = function( config ) {
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
    // config.uiColor = '#AADC6E';
    config.filebrowserImageUploadUrl = "UploaderFile.axd";
//    config.filebrowserUploadUrl = "actions/ckeditorUpload";
//    var pathName = window.document.location.pathname;
//    //��ȡ��"/"����Ŀ�����磺/uimcardprj
//    var projectName = pathName.substring(0, pathName.substr(1).indexOf('/') + 1);
//    config.filebrowserImageUploadUrl = projectName + '/system/upload.do'; //�̶�·��
};
