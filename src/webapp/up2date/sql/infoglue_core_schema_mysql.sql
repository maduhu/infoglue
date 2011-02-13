DROP TABLE IF EXISTS cmAvailableServiceBinding;

CREATE TABLE cmAvailableServiceBinding (
  availableServiceBindingId integer(11) unsigned NOT NULL auto_increment,
  name varchar(255) NOT NULL,
  description text NOT NULL,
  visualizationAction text NOT NULL,
  isMandatory tinyint(4) NOT NULL default '0',
  isUserEditable tinyint(4) NOT NULL default '0',
  isInheritable tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (availableServiceBindingId)
) TYPE=InnoDB;


DROP TABLE IF EXISTS cmAvailableServiceBindingSiteNodeTypeDefinition;

CREATE TABLE cmAvailableServiceBindingSiteNodeTypeDefinition (
  availableServiceBindingSiteNodeTypeDefinitionId integer(11) unsigned NOT NULL auto_increment,
  availableServiceBindingId integer(11) NOT NULL default '0',
  siteNodeTypeDefinitionId integer(11) NOT NULL default '0',
  PRIMARY KEY  (availableServiceBindingSiteNodeTypeDefinitionId)
) TYPE=InnoDB;


DROP TABLE IF EXISTS cmContent;

CREATE TABLE cmContent (
  contentId integer(11) unsigned NOT NULL auto_increment,
  name varchar(255) NOT NULL,
  publishDateTime datetime NOT NULL default '0000-00-00 00:00:00',
  expireDateTime datetime NOT NULL default '0000-00-00 00:00:00',
  contentTypeDefinitionId integer(11) default NULL,
  parentContentId integer(11) default NULL,
  creator TEXT NOT NULL,
  repositoryId integer(11) NOT NULL default '0',
  isBranch tinyint(4) NOT NULL default '0',
  isProtected tinyint(4) NOT NULL default '2',
  isDeleted TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY  (contentId)
) TYPE=InnoDB;


DROP TABLE IF EXISTS cmContentRelation;

CREATE TABLE cmContentRelation (
  contentRelationId integer(11) unsigned NOT NULL auto_increment,
  relationInternalName text NOT NULL,
  relationTypeId integer(11) NOT NULL default '0',
  sourceContentId integer(11) NOT NULL default '0',
  destinationContentId integer(11) NOT NULL default '0',
  PRIMARY KEY  (contentRelationId)
) TYPE=InnoDB;


DROP TABLE IF EXISTS cmContentTypeDefinition;

CREATE TABLE cmContentTypeDefinition (
  contentTypeDefinitionId integer(11) unsigned NOT NULL auto_increment,
  schemaValue text NOT NULL,
  name varchar(255) NOT NULL,
  parentContentTypeDefinitionId INT DEFAULT '-1',
  detailPageResolverClass VARCHAR(255) DEFAULT '',
  detailPageResolverData VARCHAR(1024) DEFAULT '',
  type tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (contentTypeDefinitionId)
) TYPE=InnoDB;


DROP TABLE IF EXISTS cmContentVersion;

CREATE TABLE cmContentVersion (
  contentVersionId integer(11) unsigned NOT NULL auto_increment,
  stateId tinyint(4) NOT NULL default '0',
  versionValue longtext NOT NULL,
  modifiedDateTime datetime NOT NULL default '0000-00-00 00:00:00',
  versionComment text NOT NULL,
  isCheckedOut tinyint(4) NOT NULL default '0',
  isActive tinyint(4) NOT NULL default '1',
  contentId integer(11) NOT NULL default '0',
  languageId integer(11) NOT NULL default '0',
  versionModifier text NOT NULL,
  PRIMARY KEY  (contentVersionId)
) TYPE=InnoDB;


DROP TABLE IF EXISTS cmContentVersionDigitalAsset;

CREATE TABLE cmContentVersionDigitalAsset (
  contentVersionDigitalAssetId integer(11) unsigned NOT NULL auto_increment,
  contentVersionId integer(11) unsigned NOT NULL default '0',
  digitalAssetId integer(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (contentVersionDigitalAssetId)
) TYPE=InnoDB;


DROP TABLE IF EXISTS cmUserPropertiesDigitalAsset;

CREATE TABLE cmUserPropertiesDigitalAsset (
  userPropertiesDigitalAssetId integer(11) unsigned NOT NULL auto_increment,
  userPropertiesId integer(11) unsigned NOT NULL default '0',
  digitalAssetId integer(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (userPropertiesDigitalAssetId)
) TYPE=InnoDB;


DROP TABLE IF EXISTS cmRolePropertiesDigitalAsset;

CREATE TABLE cmRolePropertiesDigitalAsset (
  rolePropertiesDigitalAssetId integer(11) unsigned NOT NULL auto_increment,
  rolePropertiesId integer(11) unsigned NOT NULL default '0',
  digitalAssetId integer(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (rolePropertiesDigitalAssetId)
) TYPE=InnoDB;


DROP TABLE IF EXISTS cmDigitalAsset;

CREATE TABLE cmDigitalAsset (
  digitalAssetId integer(11) unsigned NOT NULL auto_increment,
  assetKey text NOT NULL,
  assetFileName text NOT NULL,
  assetFilePath text NOT NULL,
  assetFileSize int(11) NOT NULL default '0',
  assetContentType varchar(255) NOT NULL,
  assetBlob longblob,
  PRIMARY KEY  (digitalAssetId)
) TYPE=InnoDB;


DROP TABLE IF EXISTS cmLanguage;

CREATE TABLE cmLanguage (
  languageId integer(11) unsigned NOT NULL auto_increment,
  name varchar(255) NOT NULL,
  languageCode text NOT NULL,
  charset text NOT NULL,
  PRIMARY KEY  (languageId)
) TYPE=InnoDB;


DROP TABLE IF EXISTS cmPublication;

CREATE TABLE cmPublication (
  publicationId integer(11) unsigned NOT NULL auto_increment,
  name varchar(255) NOT NULL,
  description text NOT NULL,
  publicationDateTime datetime NOT NULL default '0000-00-00 00:00:00',
  publisher text NOT NULL,
  repositoryId integer(11) NOT NULL default '0',
  PRIMARY KEY  (publicationId)
) TYPE=InnoDB;


DROP TABLE IF EXISTS cmQualifyer;

CREATE TABLE cmQualifyer (
  qualifyerId integer(11) unsigned NOT NULL auto_increment,
  name varchar(255) NOT NULL,
  value text NOT NULL,
  sortOrder integer(11) NOT NULL default '0',
  serviceBindingId integer(11) NOT NULL default '0',
  PRIMARY KEY  (qualifyerId)
) TYPE=InnoDB;


DROP TABLE IF EXISTS cmRepository;

CREATE TABLE cmRepository (
  repositoryId integer(11) unsigned NOT NULL auto_increment,
  name varchar(255) NOT NULL,
  description text NOT NULL,
  dnsName text NOT NULL,
  isDeleted TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY  (repositoryId)
) TYPE=InnoDB;


DROP TABLE IF EXISTS cmRepositoryContentTypeDefinition;

CREATE TABLE cmRepositoryContentTypeDefinition (
  repositoryContentTypeDefinitionId integer(11) unsigned NOT NULL auto_increment,
  repositoryId integer(11) NOT NULL default '0',
  contentTypeDefinitionId integer(11) NOT NULL default '0',
  PRIMARY KEY  (repositoryContentTypeDefinitionId)
) TYPE=InnoDB;


DROP TABLE IF EXISTS cmRepositoryLanguage;

CREATE TABLE cmRepositoryLanguage (
  repositoryLanguageId integer(11) unsigned NOT NULL auto_increment,
  repositoryId integer(11) NOT NULL default '0',
  languageId integer(11) NOT NULL default '0',
  isPublished tinyint(4) NOT NULL default '0',
  sortOrder tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (repositoryLanguageId)
) TYPE=InnoDB;


DROP TABLE IF EXISTS cmRole;

CREATE TABLE cmRole (
  roleName varchar(200) NOT NULL,
  description text NOT NULL,
  PRIMARY KEY  (roleName)
) TYPE=InnoDB;


DROP TABLE IF EXISTS cmServiceBinding;

CREATE TABLE cmServiceBinding (
  serviceBindingId integer(11) unsigned NOT NULL auto_increment,
  name varchar(255) NOT NULL,
  path text NOT NULL,
  bindingTypeId integer(11) NOT NULL default '0',
  serviceDefinitionId integer(11) NOT NULL default '0',
  availableServiceBindingId integer(11) NOT NULL default '0',
  siteNodeVersionId integer(11) NOT NULL default '0',
  PRIMARY KEY  (serviceBindingId)
) TYPE=InnoDB;


DROP TABLE IF EXISTS cmServiceDefinition;

CREATE TABLE cmServiceDefinition (
  serviceDefinitionId integer(11) unsigned NOT NULL auto_increment,
  className text NOT NULL,
  name varchar(255) NOT NULL,
  description text NOT NULL,
  PRIMARY KEY  (serviceDefinitionId)
) TYPE=InnoDB;


DROP TABLE IF EXISTS cmServiceDefinitionAvailableServiceBinding;

CREATE TABLE cmServiceDefinitionAvailableServiceBinding (
  serviceDefinitionAvailableServiceBindingId integer(11) unsigned NOT NULL auto_increment,
  serviceDefinitionId integer(11) NOT NULL default '0',
  availableServiceBindingId integer(11) NOT NULL default '0',
  PRIMARY KEY  (serviceDefinitionAvailableServiceBindingId)
) TYPE=InnoDB;


DROP TABLE IF EXISTS cmSiteNode;

CREATE TABLE cmSiteNode (
  siteNodeId integer(11) unsigned NOT NULL auto_increment,
  name varchar(255) NOT NULL,
  publishDateTime datetime NOT NULL default '0000-00-00 00:00:00',
  expireDateTime datetime NOT NULL default '0000-00-00 00:00:00',
  parentSiteNodeId integer(11) default NULL,
  creator text NOT NULL,
  repositoryId integer(11) NOT NULL default '0',
  siteNodeTypeDefinitionId integer(11) default '0',
  isBranch tinyint(4) NOT NULL default '0',
  metaInfoContentId INTEGER NULL DEFAULT '-1',
  isDeleted TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY  (siteNodeId)
) TYPE=InnoDB;


DROP TABLE IF EXISTS cmSiteNodeTypeDefinition;

CREATE TABLE cmSiteNodeTypeDefinition (
  siteNodeTypeDefinitionId integer(11) unsigned NOT NULL auto_increment,
  invokerClassName text NOT NULL,
  name varchar(255) NOT NULL,
  description text NOT NULL,
  PRIMARY KEY  (siteNodeTypeDefinitionId)
) TYPE=InnoDB;


DROP TABLE IF EXISTS cmSiteNodeVersion;

CREATE TABLE cmSiteNodeVersion (
  siteNodeVersionId integer(11) unsigned NOT NULL auto_increment,
  stateId tinyint(4) NOT NULL default '0',
  versionNumber integer(11) NOT NULL default '0',
  modifiedDateTime datetime NOT NULL default '0000-00-00 00:00:00',
  versionComment text NOT NULL,
  isCheckedOut tinyint(4) NOT NULL default '0',
  isActive tinyint(4) NOT NULL default '1',
  siteNodeId integer(11) NOT NULL default '0',
  versionModifier text NOT NULL,
  isProtected tinyint(4) NOT NULL default '2',
  disablePageCache tinyint(4) NOT NULL default '2',
  disableEditOnSight tinyint(4) NOT NULL default '2',
  disableLanguages tinyint(4) NOT NULL default '2',
  disableForceIDCheck tinyint(4) NOT NULL default '2',
  forceProtocolChange tinyint(4) NOT NULL default '0',
  contentType varchar(255),
  pageCacheKey varchar(255) NOT NULL default 'default',
  pageCacheTimeout varchar(20) default NULL,
  sortOrder INTEGER NOT NULL DEFAULT -1,
  isHidden TINYINT UNSIGNED NOT NULL DEFAULT 0,
  PRIMARY KEY  (siteNodeVersionId)
) TYPE=InnoDB;


DROP TABLE IF EXISTS cmSystemUser;

CREATE TABLE cmSystemUser (
  userName varchar(200) NOT NULL,
  password varchar(255) NOT NULL,
  firstName text NOT NULL,
  lastName text NOT NULL,
  email text NOT NULL,
  PRIMARY KEY  (userName)
) TYPE=InnoDB;


DROP TABLE IF EXISTS cmSystemUserRole;

CREATE TABLE cmSystemUserRole (
  userName varchar(100) NOT NULL,
  roleName varchar(200) NOT NULL,
  PRIMARY KEY  (userName, roleName)
) TYPE=InnoDB;


DROP TABLE IF EXISTS cmTransactionHistory;

CREATE TABLE cmTransactionHistory (
  transactionHistoryId integer(11) unsigned NOT NULL auto_increment,
  name varchar(255) NOT NULL,
  transactionDateTime datetime NOT NULL default '0000-00-00 00:00:00',
  transactionTypeId integer(11) NOT NULL default '0',
  transactionObjectId text NOT NULL,
  transactionObjectName text NOT NULL,
  systemUserName text NOT NULL,
  PRIMARY KEY  (transactionHistoryId)
) TYPE=InnoDB;


DROP TABLE IF EXISTS cmPublicationDetail;

CREATE TABLE cmPublicationDetail (
  publicationDetailId integer(11) NOT NULL auto_increment,
  publicationId integer(11) NOT NULL default '0',
  name varchar(255) NOT NULL,
  description text NOT NULL,
  entityClass text NOT NULL,
  entityId integer(11) NOT NULL default '0',
  creationDateTime timestamp(14) NOT NULL,
  typeId integer(11) NOT NULL default '0',
  publisher text NOT NULL,
  PRIMARY KEY  (publicationDetailId)
) TYPE=InnoDB;


DROP TABLE IF EXISTS cmEvent;

CREATE TABLE cmEvent (
  eventId integer(11) NOT NULL auto_increment,
  repositoryId integer(11) NOT NULL default '0',
  name varchar(255) NOT NULL,
  description text NOT NULL,
  entityClass text NOT NULL,
  entityId integer(11) NOT NULL default '0',
  creationDateTime timestamp(14) NOT NULL,
  typeId integer(11) NOT NULL default '0',
  creator text NOT NULL,
  PRIMARY KEY  (eventId)
) TYPE=InnoDB;


DROP TABLE IF EXISTS cmRoleContentTypeDefinition;

CREATE TABLE cmRoleContentTypeDefinition (
  roleContentTypeDefinitionId int(11) NOT NULL auto_increment,
  roleName text NOT NULL,
  contentTypeDefinitionId int(11) NOT NULL default '0',
  PRIMARY KEY  (roleContentTypeDefinitionId)
) TYPE=InnoDB;


DROP TABLE IF EXISTS cmRoleProperties;

CREATE TABLE cmRoleProperties (
  rolePropertiesId int(11) NOT NULL auto_increment,
  roleName text NOT NULL,
  contentTypeDefinitionId int(11) NOT NULL default '0',
  value text NOT NULL,
  languageId int(11) NOT NULL default '0',
  PRIMARY KEY  (rolePropertiesId)
) TYPE=InnoDB;


DROP TABLE IF EXISTS cmUserContentTypeDefinition;

CREATE TABLE cmUserContentTypeDefinition (
  userContentTypeDefinitionId int(11) NOT NULL auto_increment,
  userName text NOT NULL,
  contentTypeDefinitionId int(11) NOT NULL default '0',
  PRIMARY KEY  (userContentTypeDefinitionId)
) TYPE=InnoDB;


DROP TABLE IF EXISTS cmUserProperties;

CREATE TABLE cmUserProperties (
  userPropertiesId int(11) NOT NULL auto_increment,
  userName text NOT NULL,
  contentTypeDefinitionId int(11) NOT NULL default '0',
  value text NOT NULL,
  languageId int(11) NOT NULL default '0',
  PRIMARY KEY  (userPropertiesId)
) TYPE=InnoDB;


DROP TABLE IF EXISTS cmAccessRight;

CREATE TABLE cmAccessRight (
  accessRightId int(11) NOT NULL auto_increment,
  parameters text NULL,
  interceptionPointId int(11) NOT NULL,
  PRIMARY KEY  (accessRightId)
) TYPE=InnoDB;


DROP TABLE IF EXISTS cmInterceptionPoint;

CREATE TABLE cmInterceptionPoint (
  interceptionPointId int(11) NOT NULL auto_increment,
  category text NOT NULL,
  name varchar(255) NOT NULL,
  description text NOT NULL,
  usesExtraDataForAccessControl int(11) default '0' NULL,
  PRIMARY KEY  (interceptionPointId)
) TYPE=InnoDB;


DROP TABLE IF EXISTS cmInterceptionPointInterceptor;

CREATE TABLE cmInterceptionPointInterceptor (
  interceptionPointId int(11) NOT NULL,
  interceptorId int(11) NOT NULL,
  PRIMARY KEY  (interceptionPointId, interceptorId)
) TYPE=InnoDB;


DROP TABLE IF EXISTS cmInterceptor;

CREATE TABLE cmInterceptor (
  interceptorId int(11) NOT NULL auto_increment,
  name varchar(255) NOT NULL,
  className text NOT NULL,
  description text NOT NULL,
  PRIMARY KEY  (interceptorId)
) TYPE=InnoDB;



DROP TABLE IF EXISTS OS_PROPERTYENTRY cascade;

CREATE TABLE OS_PROPERTYENTRY
(
	entity_name varchar(125) not null,
	entity_id bigint not null default '0',
	entity_key varchar(150) not null,
	key_type int,
	boolean_val tinyint,
	string_val varchar(200),
	long_val bigint,
	date_val datetime,
	data_val blob,
	double_val double,
	int_val int,
	primary key (entity_name, entity_id, entity_key)
)TYPE=InnoDB;


DROP TABLE IF EXISTS OS_WFENTRY cascade;
CREATE TABLE OS_WFENTRY
(
    ID bigint NOT NULL auto_increment,
    NAME varchar(60),
    STATE integer,
    primary key (ID)
)TYPE=InnoDB;


DROP TABLE IF EXISTS OS_CURRENTSTEP;
CREATE TABLE OS_CURRENTSTEP
(
    ID bigint NOT NULL auto_increment,
    ENTRY_ID bigint,
    STEP_ID integer,
    ACTION_ID integer,
    OWNER varchar(255),
    START_DATE datetime,
    FINISH_DATE datetime,
    DUE_DATE datetime,
    STATUS varchar(40),
	CALLER varchar(255),
    primary key (ID),
    index (ENTRY_ID),
    foreign key (ENTRY_ID) references OS_WFENTRY(ID),
    index (OWNER),
    index (CALLER),
    stepIndex integer NOT NULL default '0'
)TYPE=InnoDB;

DROP TABLE IF EXISTS OS_HISTORYSTEP;
CREATE TABLE OS_HISTORYSTEP
(
    ID bigint NOT NULL auto_increment,
    ENTRY_ID bigint,
    STEP_ID integer,
    ACTION_ID integer,
    OWNER varchar(255),
    START_DATE datetime,
    FINISH_DATE datetime,
    DUE_DATE datetime,
    STATUS varchar(40),
    CALLER varchar(255),
    primary key (ID),
    index (ENTRY_ID),
    foreign key (ENTRY_ID) references OS_WFENTRY(ID),
    index (OWNER),
    index (CALLER),
    stepIndex integer NOT NULL default '0'
)TYPE=InnoDB;

DROP TABLE IF EXISTS OS_CURRENTSTEP_PREV;
CREATE TABLE OS_CURRENTSTEP_PREV
(
    ID bigint NOT NULL,
    PREVIOUS_ID bigint NOT NULL,
    primary key (ID, PREVIOUS_ID),
    index (ID),
    foreign key (ID) references OS_CURRENTSTEP(ID),
    index (PREVIOUS_ID),
    foreign key (PREVIOUS_ID) references OS_HISTORYSTEP(ID)
)TYPE=InnoDB;

DROP TABLE IF EXISTS OS_HISTORYSTEP_PREV;
CREATE TABLE OS_HISTORYSTEP_PREV
(
    ID bigint NOT NULL,
    PREVIOUS_ID bigint NOT NULL,
    primary key (ID, PREVIOUS_ID),
    index (ID),
    foreign key (ID) references OS_HISTORYSTEP(ID),
    index (PREVIOUS_ID),
    foreign key (PREVIOUS_ID) references OS_HISTORYSTEP(ID)
)TYPE=InnoDB;

DROP TABLE IF EXISTS OS_STEPIDS;
CREATE TABLE OS_STEPIDS
(
	 ID bigint NOT NULL AUTO_INCREMENT,
	 PRIMARY KEY (id)
 )TYPE=InnoDB;
 


DROP TABLE IF EXISTS cmCategory;

CREATE TABLE cmCategory
(
	categoryId		INTEGER(11) unsigned NOT NULL auto_increment,
	name			VARCHAR(100) NOT NULL,
	displayName		VARCHAR(4096),
	description		TEXT,
	active			TINYINT(4) NOT NULL default '1',
	parentId		INTEGER(11),
	PRIMARY KEY (categoryId)
);


DROP TABLE IF EXISTS cmContentCategory;

CREATE TABLE cmContentCategory
(
	contentCategoryId	INTEGER(11) unsigned NOT NULL auto_increment,
	attributeName		VARCHAR(100) NOT NULL,
	contentVersionId	INTEGER(11) NOT NULL,
	categoryId			INTEGER(11) NOT NULL,
	PRIMARY KEY (contentCategoryId)
);


DROP TABLE IF EXISTS cmGroupPropertiesDigitalAsset;

CREATE TABLE cmGroupPropertiesDigitalAsset (
  groupPropertiesDigitalAssetId integer(11) unsigned NOT NULL auto_increment,
  groupPropertiesId integer(11) unsigned NOT NULL default '0',
  digitalAssetId integer(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (groupPropertiesDigitalAssetId)
) TYPE=InnoDB;


DROP TABLE IF EXISTS cmPropertiesCategory;

CREATE TABLE cmPropertiesCategory
(
	propertiesCategoryId	INTEGER(11) unsigned NOT NULL auto_increment,
	attributeName		VARCHAR(100) NOT NULL,
	entityName			VARCHAR(100) NOT NULL,
	entityId			INTEGER(11) NOT NULL,
	categoryId			INTEGER(11) NOT NULL,
	PRIMARY KEY (propertiesCategoryId)
);


DROP TABLE IF EXISTS cmRegistry;

CREATE TABLE cmRegistry
(
	registryId		            INTEGER(11) unsigned NOT NULL auto_increment,
	entityName		            VARCHAR(100) NOT NULL,
	entityId		            VARCHAR(200) NOT NULL,
	referenceType	            TINYINT(4) NOT NULL,
	referencingEntityName		 VARCHAR(100) NOT NULL,
	referencingEntityId		     VARCHAR(200) NOT NULL,
	referencingEntityComplName	 VARCHAR(100) NOT NULL,
	referencingEntityComplId	 VARCHAR(200) NOT NULL,
    PRIMARY KEY (registryId)
);

DROP TABLE IF EXISTS cmGroup;

CREATE TABLE cmGroup (
  groupName varchar(255) NOT NULL default '',
  description text NOT NULL,
  PRIMARY KEY  (groupName)
) TYPE=InnoDB;

DROP TABLE IF EXISTS cmGroupContentTypeDefinition;

CREATE TABLE cmGroupContentTypeDefinition (
  groupContentTypeDefinitionId int(11) NOT NULL auto_increment,
  groupName text NOT NULL,
  contentTypeDefinitionId int(11) NOT NULL default '0',
  PRIMARY KEY  (groupContentTypeDefinitionId)
) TYPE=InnoDB;


DROP TABLE IF EXISTS cmGroupProperties;

CREATE TABLE cmGroupProperties (
  groupPropertiesId int(11) NOT NULL auto_increment,
  groupName text NOT NULL,
  contentTypeDefinitionId int(11) NOT NULL default '0',
  value text NOT NULL,
  languageId int(11) NOT NULL default '0',
  PRIMARY KEY  (groupPropertiesId)
) TYPE=InnoDB;


DROP TABLE IF EXISTS cmSystemUserGroup;

CREATE TABLE cmSystemUserGroup (
  userName varchar(150) NOT NULL default '',
  groupName varchar(150) NOT NULL default '',
  PRIMARY KEY  (userName,groupName)
) TYPE=InnoDB;


DROP TABLE IF EXISTS cmAccessRightRole;

CREATE TABLE cmAccessRightRole (
  accessRightRoleId int(11) NOT NULL auto_increment,
  accessRightId int(11) NOT NULL default '0',
  roleName varchar(150) NOT NULL default '',
  PRIMARY KEY  (accessRightRoleId)
) TYPE=InnoDB;

DROP TABLE IF EXISTS cmAccessRightGroup;

CREATE TABLE cmAccessRightGroup (
  accessRightGroupId int(11) NOT NULL auto_increment,
  accessRightId int(11) NOT NULL default '0',
  groupName varchar(150) NOT NULL default '',
  PRIMARY KEY  (accessRightGroupId)
) TYPE=InnoDB;

DROP TABLE IF EXISTS cmAccessRightUser;

CREATE TABLE cmAccessRightUser (
  accessRightUserId int(11) NOT NULL auto_increment,
  accessRightId int(11) NOT NULL default '0',
  userName varchar(150) NOT NULL default '',
  PRIMARY KEY  (accessRightUserId)
) TYPE=InnoDB;


DROP TABLE IF EXISTS cmWorkflowDefinition;

CREATE TABLE cmWorkflowDefinition (
  workflowDefinitionId int(11) NOT NULL auto_increment,
  name text NOT NULL,
  value text NOT NULL,
  PRIMARY KEY  (workflowDefinitionId)
) TYPE=InnoDB;
 
DROP TABLE IF EXISTS cmRedirect;

CREATE TABLE cmRedirect (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  url TEXT NOT NULL,
  redirectUrl TEXT NOT NULL,
  PRIMARY KEY(id)
) TYPE = InnoDB;

DROP TABLE IF EXISTS cmAccessRightUser;

CREATE TABLE cmAccessRightUser (
  accessRightUserId int(11) NOT NULL auto_increment,
  accessRightId int(11) NOT NULL default '0',
  userName varchar(150) NOT NULL default '',
  PRIMARY KEY  (accessRightUserId)
) TYPE=InnoDB;

DROP TABLE IF EXISTS cmServerNode;

CREATE TABLE cmServerNode (
  serverNodeId integer(11) unsigned NOT NULL auto_increment,
  name varchar(255) NOT NULL,
  description text NOT NULL,
  dnsName text NOT NULL,
  PRIMARY KEY  (serverNodeId)
) TYPE=InnoDB;

DROP TABLE IF EXISTS cmFormEntry;
CREATE TABLE  cmFormEntry (
  id int(10) unsigned NOT NULL auto_increment,
  userName VARCHAR(255),
  originAddress varchar(1024) NOT NULL,
  formName varchar(255) NOT NULL,
  formContentId int(10) unsigned NOT NULL,
  userIP varchar(20) NOT NULL,
  userAgent varchar(255) NOT NULL,
  registrationDateTime DATETIME,
PRIMARY KEY  (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS cmFormEntryValue;
CREATE TABLE  cmFormEntryValue (
  id int(10) unsigned NOT NULL auto_increment,
  name varchar(128) NOT NULL,
  value varchar(4096),
  formEntryId int(10) unsigned NOT NULL,
  PRIMARY KEY  (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS cmFormEntryAsset;
CREATE TABLE cmFormEntryAsset (
  id INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  formEntryId INTEGER UNSIGNED NOT NULL,
  fileName VARCHAR(255) NOT NULL,
  fileSize INTEGER UNSIGNED NOT NULL,
  assetKey VARCHAR(255) NOT NULL,
  contentType VARCHAR(50) NOT NULL,
  assetBlob BLOB NOT NULL,
  PRIMARY KEY(id)
) ENGINE = InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS cmSubscription;
CREATE TABLE cmSubscription (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  interceptionPointId INTEGER UNSIGNED NOT NULL,
  name varchar(100) NOT NULL,
  isGlobal tinyint(4) NOT NULL default '0',
  entityName varchar(100) default NULL,
  entityId varchar(200) default NULL,
  userName varchar(150) NOT NULL,
  userEmail varchar(150) default NULL,
  lastNotifiedDateTime timestamp default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP,
  PRIMARY KEY(id)
) TYPE = InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS cmSubscriptionFilter;

CREATE TABLE cmSubscriptionFilter (
  id int(10) unsigned NOT NULL AUTO_INCREMENT,
  subscriptionId INTEGER UNSIGNED NOT NULL,
  filterType varchar(50) NOT NULL,
  filterCondition varchar(255) NOT NULL,
  isAndCondition tinyint(4) NOT NULL default '1',
  PRIMARY KEY(id)
) TYPE = InnoDB DEFAULT CHARSET=utf8;

DROP TABLE IF EXISTS cmInfoGlueProperties;

CREATE TABLE cmInfoGlueProperties (
  propertyId int(11) NOT NULL auto_increment,
  name text NOT NULL,
  value text NOT NULL,
  PRIMARY KEY  (propertyId)
) TYPE=InnoDB;

INSERT INTO cmInfoGlueProperties(name, value) VALUES
  ('version', '2.9.8.7');
 
CREATE INDEX serviceBindingId ON cmQualifyer(serviceBindingId);
CREATE INDEX serviceDefinitionId ON cmServiceBinding(serviceDefinitionId);
CREATE INDEX availableServiceBindingId ON cmServiceBinding(availableServiceBindingId);
CREATE INDEX siteNodeVersionId ON cmServiceBinding(siteNodeVersionId);
CREATE INDEX name ON cmContentTypeDefinition(name);
CREATE INDEX contentId ON cmContentVersion(contentId);
CREATE INDEX contentTypeDefinitionId ON cmContent(contentTypeDefinitionId);
CREATE INDEX siteNodeId ON cmSiteNodeVersion(siteNodeId);
CREATE INDEX parentContentId ON cmContent (parentContentId);
CREATE INDEX publicationId ON cmPublicationDetail (publicationId);
CREATE INDEX attributeName_categoryId on cmContentCategory (attributeName, categoryId);
CREATE INDEX contentVersionId on cmContentCategory (contentVersionId);
 
CREATE INDEX CS_OWNER ON OS_CURRENTSTEP(OWNER);
CREATE INDEX CS_CALLER ON OS_CURRENTSTEP(CALLER);
CREATE INDEX HS_OWNER ON OS_HISTORYSTEP(OWNER);
CREATE INDEX HS_CALLER ON OS_HISTORYSTEP(CALLER);

CREATE INDEX referencingEntityName ON cmRegistry(referencingEntityName);
CREATE INDEX referencingEntityId ON cmRegistry(referencingEntityId);
CREATE INDEX entityName ON cmRegistry(entityName);
CREATE INDEX entityId ON cmRegistry(entityId);
CREATE INDEX referencingEntityComplName ON cmRegistry(referencingEntityComplName);
CREATE INDEX referencingEntityComplId ON cmRegistry(referencingEntityComplId);
CREATE INDEX categoryContVersionId ON cmContentCategory(contentVersionId);
CREATE INDEX contVerDigAssetDigAssId ON cmContentVersionDigitalAsset(digitalAssetId);
CREATE INDEX contVerDigAssetContVerId ON cmContentVersionDigitalAsset(contentVersionId);
CREATE INDEX redirectUrl ON cmRedirect(redirectUrl(255));
 
create index propCategoryAttrNameIndex on cmPropertiesCategory(attributeName(100));
create index propCategoryEntityNameIndex on cmPropertiesCategory(entityName(100));
create index propCategoryEntityIdIndex on cmPropertiesCategory(entityId);
create index propCategoryCategoryIdIndex on cmPropertiesCategory(categoryId);
create index categoryParentIdIndex on cmCategory(parentId);
create index categoryNameIndex on cmCategory(name(100));

COMMIT;


