using TypeSpec.Http;
using TypeSpec.OpenAPI;

namespace SolvedAC;

/**
 * CLASS가 높은 사용자가 먼저 오도록 정렬한 사용자 목록을 가져옵니다.
 *
 * @return
 *     페이지네이션 가능한 사용자 목록을 반환합니다.
 */
@summary("CLASS 순 사용자 랭킹 가져오기")
@tag("ranking")
@useAuth(TokenAuth)
@get
@route("/ranking/class")
op getRankingByClass(
  /**
   * 응답을 받을 언어입니다.
   */
  @header
  `x-solvedac-language`?: Language,

  /**
   * 페이지
   */
  @query
  page?: uint32,
): GetRankingByClass.Ok;

namespace GetRankingByClass {
  @extension(XInternal, true)
  model Ok {
    @statusCode status: 200;
    @body data: PaginatedList<RivalUser>;
  }
}
