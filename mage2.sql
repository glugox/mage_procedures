/* -------------------------------------------------- */

DROP FUNCTION IF EXISTS CAT_ENTITY_TYPE_ID;
DELIMITER $$
CREATE FUNCTION CAT_ENTITY_TYPE_ID()
  RETURNS INT(11)
  LANGUAGE SQL -- Optional
BEGIN
  DECLARE ret INT(11);
	SELECT entity_type_id FROM eav_entity_type WHERE entity_type_code = 'catalog_category' INTO ret;
	RETURN ret;
END;
$$
DELIMITER ;

/* -------------------------------------------------- */

DROP FUNCTION IF EXISTS PRODUCT_ENTITY_TYPE_ID;
DELIMITER $$
CREATE FUNCTION PRODUCT_ENTITY_TYPE_ID()
  RETURNS INT(11)
  LANGUAGE SQL -- Optional
BEGIN
  DECLARE ret INT(11);
	SELECT entity_type_id FROM eav_entity_type WHERE entity_type_code = 'catalog_product' INTO ret;
	RETURN ret;
END;
$$
DELIMITER ;

/* -------------------------------------------------- */

DROP FUNCTION IF EXISTS CAT_ATTR_ID;
DELIMITER $$
CREATE FUNCTION CAT_ATTR_ID(prm_attr_code TEXT)
  RETURNS TEXT
  LANGUAGE SQL -- Optional
BEGIN
  DECLARE ret INT;
  SELECT attribute_id FROM eav_attribute WHERE attribute_code = prm_attr_code AND entity_type_id = CAT_ENTITY_TYPE_ID() INTO ret;
  RETURN ret;
END;
$$
DELIMITER ;

/* -------------------------------------------------- */

DROP FUNCTION IF EXISTS PRODUCT_ATTR_ID;
DELIMITER $$
CREATE FUNCTION PRODUCT_ATTR_ID(prm_attr_code TEXT)
  RETURNS TEXT
  LANGUAGE SQL -- Optional
BEGIN
  DECLARE ret INT;
  SELECT attribute_id FROM eav_attribute WHERE attribute_code = prm_attr_code AND entity_type_id = PRODUCT_ENTITY_TYPE_ID() INTO ret;
  RETURN ret;
END;
$$
DELIMITER ;