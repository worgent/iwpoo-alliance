package iwpoo.alliance.model;

import java.util.ArrayList;
import java.util.List;

public class AllianceHotArticleExample {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table alliance_hot_article
     *
     * @mbggenerated
     */
    protected String orderByClause;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table alliance_hot_article
     *
     * @mbggenerated
     */
    protected boolean distinct;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database table alliance_hot_article
     *
     * @mbggenerated
     */
    protected List<Criteria> oredCriteria;

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table alliance_hot_article
     *
     * @mbggenerated
     */
    public AllianceHotArticleExample() {
        oredCriteria = new ArrayList<Criteria>();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table alliance_hot_article
     *
     * @mbggenerated
     */
    public void setOrderByClause(String orderByClause) {
        this.orderByClause = orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table alliance_hot_article
     *
     * @mbggenerated
     */
    public String getOrderByClause() {
        return orderByClause;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table alliance_hot_article
     *
     * @mbggenerated
     */
    public void setDistinct(boolean distinct) {
        this.distinct = distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table alliance_hot_article
     *
     * @mbggenerated
     */
    public boolean isDistinct() {
        return distinct;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table alliance_hot_article
     *
     * @mbggenerated
     */
    public List<Criteria> getOredCriteria() {
        return oredCriteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table alliance_hot_article
     *
     * @mbggenerated
     */
    public void or(Criteria criteria) {
        oredCriteria.add(criteria);
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table alliance_hot_article
     *
     * @mbggenerated
     */
    public Criteria or() {
        Criteria criteria = createCriteriaInternal();
        oredCriteria.add(criteria);
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table alliance_hot_article
     *
     * @mbggenerated
     */
    public Criteria createCriteria() {
        Criteria criteria = createCriteriaInternal();
        if (oredCriteria.size() == 0) {
            oredCriteria.add(criteria);
        }
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table alliance_hot_article
     *
     * @mbggenerated
     */
    protected Criteria createCriteriaInternal() {
        Criteria criteria = new Criteria();
        return criteria;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table alliance_hot_article
     *
     * @mbggenerated
     */
    public void clear() {
        oredCriteria.clear();
        orderByClause = null;
        distinct = false;
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table alliance_hot_article
     *
     * @mbggenerated
     */
    protected abstract static class GeneratedCriteria {
        protected List<Criterion> criteria;

        protected GeneratedCriteria() {
            super();
            criteria = new ArrayList<Criterion>();
        }

        public boolean isValid() {
            return criteria.size() > 0;
        }

        public List<Criterion> getAllCriteria() {
            return criteria;
        }

        public List<Criterion> getCriteria() {
            return criteria;
        }

        protected void addCriterion(String condition) {
            if (condition == null) {
                throw new RuntimeException("Value for condition cannot be null");
            }
            criteria.add(new Criterion(condition));
        }

        protected void addCriterion(String condition, Object value, String property) {
            if (value == null) {
                throw new RuntimeException("Value for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value));
        }

        protected void addCriterion(String condition, Object value1, Object value2, String property) {
            if (value1 == null || value2 == null) {
                throw new RuntimeException("Between values for " + property + " cannot be null");
            }
            criteria.add(new Criterion(condition, value1, value2));
        }

        public Criteria andIdIsNull() {
            addCriterion("id is null");
            return (Criteria) this;
        }

        public Criteria andIdIsNotNull() {
            addCriterion("id is not null");
            return (Criteria) this;
        }

        public Criteria andIdEqualTo(Integer value) {
            addCriterion("id =", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotEqualTo(Integer value) {
            addCriterion("id <>", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThan(Integer value) {
            addCriterion("id >", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("id >=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThan(Integer value) {
            addCriterion("id <", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdLessThanOrEqualTo(Integer value) {
            addCriterion("id <=", value, "id");
            return (Criteria) this;
        }

        public Criteria andIdIn(List<Integer> values) {
            addCriterion("id in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotIn(List<Integer> values) {
            addCriterion("id not in", values, "id");
            return (Criteria) this;
        }

        public Criteria andIdBetween(Integer value1, Integer value2) {
            addCriterion("id between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andIdNotBetween(Integer value1, Integer value2) {
            addCriterion("id not between", value1, value2, "id");
            return (Criteria) this;
        }

        public Criteria andMediaIdIsNull() {
            addCriterion("media_id is null");
            return (Criteria) this;
        }

        public Criteria andMediaIdIsNotNull() {
            addCriterion("media_id is not null");
            return (Criteria) this;
        }

        public Criteria andMediaIdEqualTo(Integer value) {
            addCriterion("media_id =", value, "mediaId");
            return (Criteria) this;
        }

        public Criteria andMediaIdNotEqualTo(Integer value) {
            addCriterion("media_id <>", value, "mediaId");
            return (Criteria) this;
        }

        public Criteria andMediaIdGreaterThan(Integer value) {
            addCriterion("media_id >", value, "mediaId");
            return (Criteria) this;
        }

        public Criteria andMediaIdGreaterThanOrEqualTo(Integer value) {
            addCriterion("media_id >=", value, "mediaId");
            return (Criteria) this;
        }

        public Criteria andMediaIdLessThan(Integer value) {
            addCriterion("media_id <", value, "mediaId");
            return (Criteria) this;
        }

        public Criteria andMediaIdLessThanOrEqualTo(Integer value) {
            addCriterion("media_id <=", value, "mediaId");
            return (Criteria) this;
        }

        public Criteria andMediaIdIn(List<Integer> values) {
            addCriterion("media_id in", values, "mediaId");
            return (Criteria) this;
        }

        public Criteria andMediaIdNotIn(List<Integer> values) {
            addCriterion("media_id not in", values, "mediaId");
            return (Criteria) this;
        }

        public Criteria andMediaIdBetween(Integer value1, Integer value2) {
            addCriterion("media_id between", value1, value2, "mediaId");
            return (Criteria) this;
        }

        public Criteria andMediaIdNotBetween(Integer value1, Integer value2) {
            addCriterion("media_id not between", value1, value2, "mediaId");
            return (Criteria) this;
        }

        public Criteria andHotArticleNameIsNull() {
            addCriterion("hot_article_name is null");
            return (Criteria) this;
        }

        public Criteria andHotArticleNameIsNotNull() {
            addCriterion("hot_article_name is not null");
            return (Criteria) this;
        }

        public Criteria andHotArticleNameEqualTo(String value) {
            addCriterion("hot_article_name =", value, "hotArticleName");
            return (Criteria) this;
        }

        public Criteria andHotArticleNameNotEqualTo(String value) {
            addCriterion("hot_article_name <>", value, "hotArticleName");
            return (Criteria) this;
        }

        public Criteria andHotArticleNameGreaterThan(String value) {
            addCriterion("hot_article_name >", value, "hotArticleName");
            return (Criteria) this;
        }

        public Criteria andHotArticleNameGreaterThanOrEqualTo(String value) {
            addCriterion("hot_article_name >=", value, "hotArticleName");
            return (Criteria) this;
        }

        public Criteria andHotArticleNameLessThan(String value) {
            addCriterion("hot_article_name <", value, "hotArticleName");
            return (Criteria) this;
        }

        public Criteria andHotArticleNameLessThanOrEqualTo(String value) {
            addCriterion("hot_article_name <=", value, "hotArticleName");
            return (Criteria) this;
        }

        public Criteria andHotArticleNameLike(String value) {
            addCriterion("hot_article_name like", value, "hotArticleName");
            return (Criteria) this;
        }

        public Criteria andHotArticleNameNotLike(String value) {
            addCriterion("hot_article_name not like", value, "hotArticleName");
            return (Criteria) this;
        }

        public Criteria andHotArticleNameIn(List<String> values) {
            addCriterion("hot_article_name in", values, "hotArticleName");
            return (Criteria) this;
        }

        public Criteria andHotArticleNameNotIn(List<String> values) {
            addCriterion("hot_article_name not in", values, "hotArticleName");
            return (Criteria) this;
        }

        public Criteria andHotArticleNameBetween(String value1, String value2) {
            addCriterion("hot_article_name between", value1, value2, "hotArticleName");
            return (Criteria) this;
        }

        public Criteria andHotArticleNameNotBetween(String value1, String value2) {
            addCriterion("hot_article_name not between", value1, value2, "hotArticleName");
            return (Criteria) this;
        }

        public Criteria andExposureNumIsNull() {
            addCriterion("exposure_num is null");
            return (Criteria) this;
        }

        public Criteria andExposureNumIsNotNull() {
            addCriterion("exposure_num is not null");
            return (Criteria) this;
        }

        public Criteria andExposureNumEqualTo(Integer value) {
            addCriterion("exposure_num =", value, "exposureNum");
            return (Criteria) this;
        }

        public Criteria andExposureNumNotEqualTo(Integer value) {
            addCriterion("exposure_num <>", value, "exposureNum");
            return (Criteria) this;
        }

        public Criteria andExposureNumGreaterThan(Integer value) {
            addCriterion("exposure_num >", value, "exposureNum");
            return (Criteria) this;
        }

        public Criteria andExposureNumGreaterThanOrEqualTo(Integer value) {
            addCriterion("exposure_num >=", value, "exposureNum");
            return (Criteria) this;
        }

        public Criteria andExposureNumLessThan(Integer value) {
            addCriterion("exposure_num <", value, "exposureNum");
            return (Criteria) this;
        }

        public Criteria andExposureNumLessThanOrEqualTo(Integer value) {
            addCriterion("exposure_num <=", value, "exposureNum");
            return (Criteria) this;
        }

        public Criteria andExposureNumIn(List<Integer> values) {
            addCriterion("exposure_num in", values, "exposureNum");
            return (Criteria) this;
        }

        public Criteria andExposureNumNotIn(List<Integer> values) {
            addCriterion("exposure_num not in", values, "exposureNum");
            return (Criteria) this;
        }

        public Criteria andExposureNumBetween(Integer value1, Integer value2) {
            addCriterion("exposure_num between", value1, value2, "exposureNum");
            return (Criteria) this;
        }

        public Criteria andExposureNumNotBetween(Integer value1, Integer value2) {
            addCriterion("exposure_num not between", value1, value2, "exposureNum");
            return (Criteria) this;
        }

        public Criteria andReadNumIsNull() {
            addCriterion("read_num is null");
            return (Criteria) this;
        }

        public Criteria andReadNumIsNotNull() {
            addCriterion("read_num is not null");
            return (Criteria) this;
        }

        public Criteria andReadNumEqualTo(Integer value) {
            addCriterion("read_num =", value, "readNum");
            return (Criteria) this;
        }

        public Criteria andReadNumNotEqualTo(Integer value) {
            addCriterion("read_num <>", value, "readNum");
            return (Criteria) this;
        }

        public Criteria andReadNumGreaterThan(Integer value) {
            addCriterion("read_num >", value, "readNum");
            return (Criteria) this;
        }

        public Criteria andReadNumGreaterThanOrEqualTo(Integer value) {
            addCriterion("read_num >=", value, "readNum");
            return (Criteria) this;
        }

        public Criteria andReadNumLessThan(Integer value) {
            addCriterion("read_num <", value, "readNum");
            return (Criteria) this;
        }

        public Criteria andReadNumLessThanOrEqualTo(Integer value) {
            addCriterion("read_num <=", value, "readNum");
            return (Criteria) this;
        }

        public Criteria andReadNumIn(List<Integer> values) {
            addCriterion("read_num in", values, "readNum");
            return (Criteria) this;
        }

        public Criteria andReadNumNotIn(List<Integer> values) {
            addCriterion("read_num not in", values, "readNum");
            return (Criteria) this;
        }

        public Criteria andReadNumBetween(Integer value1, Integer value2) {
            addCriterion("read_num between", value1, value2, "readNum");
            return (Criteria) this;
        }

        public Criteria andReadNumNotBetween(Integer value1, Integer value2) {
            addCriterion("read_num not between", value1, value2, "readNum");
            return (Criteria) this;
        }

        public Criteria andHotArticleLinkIsNull() {
            addCriterion("hot_article_link is null");
            return (Criteria) this;
        }

        public Criteria andHotArticleLinkIsNotNull() {
            addCriterion("hot_article_link is not null");
            return (Criteria) this;
        }

        public Criteria andHotArticleLinkEqualTo(String value) {
            addCriterion("hot_article_link =", value, "hotArticleLink");
            return (Criteria) this;
        }

        public Criteria andHotArticleLinkNotEqualTo(String value) {
            addCriterion("hot_article_link <>", value, "hotArticleLink");
            return (Criteria) this;
        }

        public Criteria andHotArticleLinkGreaterThan(String value) {
            addCriterion("hot_article_link >", value, "hotArticleLink");
            return (Criteria) this;
        }

        public Criteria andHotArticleLinkGreaterThanOrEqualTo(String value) {
            addCriterion("hot_article_link >=", value, "hotArticleLink");
            return (Criteria) this;
        }

        public Criteria andHotArticleLinkLessThan(String value) {
            addCriterion("hot_article_link <", value, "hotArticleLink");
            return (Criteria) this;
        }

        public Criteria andHotArticleLinkLessThanOrEqualTo(String value) {
            addCriterion("hot_article_link <=", value, "hotArticleLink");
            return (Criteria) this;
        }

        public Criteria andHotArticleLinkLike(String value) {
            addCriterion("hot_article_link like", value, "hotArticleLink");
            return (Criteria) this;
        }

        public Criteria andHotArticleLinkNotLike(String value) {
            addCriterion("hot_article_link not like", value, "hotArticleLink");
            return (Criteria) this;
        }

        public Criteria andHotArticleLinkIn(List<String> values) {
            addCriterion("hot_article_link in", values, "hotArticleLink");
            return (Criteria) this;
        }

        public Criteria andHotArticleLinkNotIn(List<String> values) {
            addCriterion("hot_article_link not in", values, "hotArticleLink");
            return (Criteria) this;
        }

        public Criteria andHotArticleLinkBetween(String value1, String value2) {
            addCriterion("hot_article_link between", value1, value2, "hotArticleLink");
            return (Criteria) this;
        }

        public Criteria andHotArticleLinkNotBetween(String value1, String value2) {
            addCriterion("hot_article_link not between", value1, value2, "hotArticleLink");
            return (Criteria) this;
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table alliance_hot_article
     *
     * @mbggenerated do_not_delete_during_merge
     */
    public static class Criteria extends GeneratedCriteria {

        protected Criteria() {
            super();
        }
    }

    /**
     * This class was generated by MyBatis Generator.
     * This class corresponds to the database table alliance_hot_article
     *
     * @mbggenerated
     */
    public static class Criterion {
        private String condition;

        private Object value;

        private Object secondValue;

        private boolean noValue;

        private boolean singleValue;

        private boolean betweenValue;

        private boolean listValue;

        private String typeHandler;

        public String getCondition() {
            return condition;
        }

        public Object getValue() {
            return value;
        }

        public Object getSecondValue() {
            return secondValue;
        }

        public boolean isNoValue() {
            return noValue;
        }

        public boolean isSingleValue() {
            return singleValue;
        }

        public boolean isBetweenValue() {
            return betweenValue;
        }

        public boolean isListValue() {
            return listValue;
        }

        public String getTypeHandler() {
            return typeHandler;
        }

        protected Criterion(String condition) {
            super();
            this.condition = condition;
            this.typeHandler = null;
            this.noValue = true;
        }

        protected Criterion(String condition, Object value, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.typeHandler = typeHandler;
            if (value instanceof List<?>) {
                this.listValue = true;
            } else {
                this.singleValue = true;
            }
        }

        protected Criterion(String condition, Object value) {
            this(condition, value, null);
        }

        protected Criterion(String condition, Object value, Object secondValue, String typeHandler) {
            super();
            this.condition = condition;
            this.value = value;
            this.secondValue = secondValue;
            this.typeHandler = typeHandler;
            this.betweenValue = true;
        }

        protected Criterion(String condition, Object value, Object secondValue) {
            this(condition, value, secondValue, null);
        }
    }
}