-- 자신을 팔로우 방지하는 트리거

DELIMITER $$

CREATE TRIGGER prevent_self_follows
  BEFORE INSERT ON follows FOR EACH ROW
  BEGIN
    IF NEW.follower_id = NEW.followee_id
    THEN
      SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT ='You can not follow yourself!';
    END IF;
  END;
$$
DELIMITER ;