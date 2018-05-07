DROP TABLE IF EXISTS `eztags`;
CREATE TABLE `eztags` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `parent_id` int(11) NOT NULL default '0',
  `main_tag_id` int(11) NOT NULL default '0',
  `keyword` varchar(255) NOT NULL default '',
  `depth` int(11) NOT NULL default '1',
  `path_string` varchar(255) NOT NULL default '',
  `modified` int(11) NOT NULL default '0',
  `remote_id` varchar(100) NOT NULL default '',
  `main_language_id` int(11) NOT NULL default '0',
  `language_mask` int(11) NOT NULL default '0',
  PRIMARY KEY ( `id` ),
  KEY `idx_eztags_keyword` ( `keyword` ),
  KEY `idx_eztags_keyword_id` ( `keyword`, `id` ),
  UNIQUE KEY `idx_eztags_remote_id` ( `remote_id` )
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `eztags_attribute_link`;
CREATE TABLE `eztags_attribute_link` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `keyword_id` int(11) NOT NULL default '0',
  `objectattribute_id` int(11) NOT NULL default '0',
  `objectattribute_version` int(11) NOT NULL default '0',
  `object_id` int(11) NOT NULL default '0',
  `priority` int(11) NOT NULL default '0',
  PRIMARY KEY ( `id` ),
  KEY `idx_eztags_attr_link_keyword_id` ( `keyword_id` ),
  KEY `idx_eztags_attr_link_kid_oaid_oav` ( `keyword_id`, `objectattribute_id`, `objectattribute_version` ),
  KEY `idx_eztags_attr_link_kid_oid` ( `keyword_id`, `object_id` ),
  KEY `idx_eztags_attr_link_oaid_oav` ( `objectattribute_id`, `objectattribute_version` )
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `eztags_keyword`;
CREATE TABLE `eztags_keyword` (
  `keyword_id` int(11) NOT NULL default '0',
  `language_id` int(11) NOT NULL default '0',
  `keyword` varchar(255) NOT NULL default '',
  `locale` varchar(255) NOT NULL default '',
  `status` int(11) NOT NULL default '0',
  PRIMARY KEY ( `keyword_id`, `locale` )
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `novaseo_meta`;
CREATE TABLE `novaseo_meta` (
  `objectattribute_id` bigint(20) unsigned NOT NULL,
  `meta_name` varchar(255) NOT NULL,
  `meta_content` varchar(255) NOT NULL,
  `objectattribute_version` int(10) unsigned NOT NULL,
  PRIMARY KEY (`objectattribute_id`,`objectattribute_version`,`meta_name`),
  KEY `novaseo_idx_content` (`objectattribute_id`,`objectattribute_version`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Page FieldType
--

DROP TABLE IF EXISTS `ezpage_attributes`;
CREATE TABLE `ezpage_attributes` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  `value` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ezpage_blocks`;
CREATE TABLE `ezpage_blocks` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL DEFAULT '',
  `view` varchar(255) NOT NULL DEFAULT '',
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ezpage_map_attributes_blocks`;
CREATE TABLE `ezpage_map_attributes_blocks` (
  `attribute_id` int(11) NOT NULL,
  `block_id` int(11) NOT NULL,
  PRIMARY KEY (`attribute_id`,`block_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ezpage_map_blocks_zones`;
CREATE TABLE `ezpage_map_blocks_zones` (
  `block_id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ezpage_map_zones_pages`;
CREATE TABLE `ezpage_map_zones_pages` (
  `zone_id` int(11) NOT NULL,
  `page_id` int(11) NOT NULL,
  PRIMARY KEY (`zone_id`,`page_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ezpage_pages`;
CREATE TABLE `ezpage_pages` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `version_no` int(11) unsigned NOT NULL,
  `content_id` int(11) NOT NULL,
  `language_code` varchar(255) NOT NULL DEFAULT '',
  `layout` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS `ezpage_zones`;
CREATE TABLE `ezpage_zones` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;
